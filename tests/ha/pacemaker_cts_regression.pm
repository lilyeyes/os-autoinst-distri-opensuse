# SUSE's openQA tests
#
# Copyright 2019 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Package: pacemaker-cts
# Summary: Execute regression tests with pacemaker-cts
# Maintainer: QE-SAP <qe-sap@suse.de>

use Mojo::Base 'haclusterbasetest';
use testapi;
use Utils::Architectures;
use package_utils qw(install_package);
use hacluster;
use transactional qw(trup_call trup_apply);
use version_utils qw(is_transactional);

sub run {
    my $cts_path = '/usr/share/pacemaker/tests';
    my @tests_to_run = qw(cts-cli cts-exec cts-scheduler cts-fencing);
    my $log = '/tmp/cts_regression.log';
    my $timeout = 600;

    # pacemaker-cts requires hostname to be solvable. Let's make sure
    # this happens in our test by adding an entry in /etc/hosts if
    # SUT fails to resolve its own name
    if (script_run('host $(hostnamectl hostname)')) {
        my $ip = get_my_ip();
        assert_script_run "echo $ip    \$(hostnamectl hostname) >> /etc/hosts";
    }

    # Some of the tests take longer to complete in aarch64.
    # This increases the timeout in that ARCH
    $timeout *= 2 if is_aarch64;

    assert_script_run('zypper ar -f -p 10 http://download.suse.de/ibs/home:/yan_gao:/branches:/SUSE:/SLFO:/1.3/standard/ gao_yan');
    assert_script_run('zypper mr --no-gpgcheck gao_yan');
    assert_script_run('zypper ref');
    #assert_script_run('transactional-update pkg dup --from gao_yan --allow-vendor-change --force-resolution --allow-downgrade');

    #install_package('pacemaker-cts=3.0.3+20260728.7052efa194-160100.2.1', trup_reboot => 1);
    install_package('-y --from gao_yan --allow-vendor-change --force-resolution --allow-downgrade pacemaker-cts', trup_reboot => 1);

    foreach my $cts_tests (@tests_to_run) {
        record_info("$cts_tests", "Starting $cts_tests");
        assert_script_run("echo ==== Starting $cts_tests ==== >> $log");
        # Use "cat -v" to escape control characters that are in the log due to bsc#1279543
	my $opt = '';
	#if ($cts_tests eq 'cts-scheduler') {
	#    $opt = '--out-dir /tmp/';
	#}
        my $cmd = "$cts_path/$cts_tests -V $opt | tee -a $log 2>&1 | cat -v; ( exit \${PIPESTATUS[0]} )";
	#if (is_transactional) {
	#    trup_call "run $cmd";
	#    trup_apply;
	#} else {
            # assert_script_run "$cts_path/$cts_tests -V | tee -a $log 2>&1 | cat -v; ( exit \${PIPESTATUS[0]} )", timeout => $timeout;
	    assert_script_run "$cmd", timeout => $timeout;
	    # script_run "$cmd", timeout => $timeout;
        #}

        save_screenshot;
    }

    upload_logs $log;
    upload_logs '/tmp/out', failok => 1; 
}

sub post_fail_hook {
    my ($self) = @_;

    # Upload the logs
    upload_logs '/tmp/cts_regression.log';

    # Execute the common part
    $self->SUPER::post_fail_hook();
}

1;
