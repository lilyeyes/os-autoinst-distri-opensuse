# SUSE's openQA tests
#
# Copyright 2024 SUSE LLC
# SPDX-License-Identifier: FSFAP

# Summary: Handles grub screen in Leap.
# Maintainer: QE YaST and Migration (QE Yam) <qe-yam at suse de>

package Yam::Agama::Pom::GrubMenuLeapPage;
use strict;
use warnings;
use testapi;

sub new {
    my ($class, $args) = @_;
    return bless {
        grub_menu_base => $args->{grub_menu_base},
        tag_first_entry_highlighted => 'grub-menu-openSUSE-leap-highlighted',
    }, $class;
}

sub expect_is_shown {
    my ($self) = @_;
    assert_screen($self->{tag_first_entry_highlighted}, 60);
}

sub edit_current_entry { shift->{grub_menu_base}->edit_current_entry() }
sub select_first_entry { shift->{grub_menu_base}->select_first_entry() }

1;
