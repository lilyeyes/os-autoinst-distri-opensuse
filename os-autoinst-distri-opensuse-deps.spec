#
# spec file for package os-autoinst-distri-opensuse-deps
#
# Copyright 2019 SUSE LINUX GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via https://bugs.opensuse.org/
#


Name:           os-autoinst-distri-opensuse-deps
Version:        1
Release:        0
Summary:        Metapackage that contains the dependencies of os-autoinst-distri-opensuse
License:        MIT
Group:          Development/Tools/Other
BuildArch:      noarch
Url:            https://github.com/os-autoinst/os-autoinst-distri-opensuse
# BEGIN AUTOGENERATED DEPENDENCY LIST
Requires:       perl(Carp)
Requires:       perl(Code::DRY)
Requires:       perl(Config::Tiny)
Requires:       perl(Cwd)
Requires:       perl(Data::Dump)
Requires:       perl(Data::Dumper)
Requires:       perl(DateTime)
Requires:       perl(Digest::file)
Requires:       perl(Exporter)
Requires:       perl(File::Basename)
Requires:       perl(File::Copy)
Requires:       perl(File::Find)
Requires:       perl(File::Path)
Requires:       perl(File::Temp)
Requires:       perl(IO::File)
Requires:       perl(IO::Socket::INET)
Requires:       perl(LWP::Simple)
Requires:       perl(List::MoreUtils)
Requires:       perl(List::Util)
Requires:       perl(Mojo::Base)
Requires:       perl(Mojo::File)
Requires:       perl(Mojo::JSON)
Requires:       perl(Mojo::UserAgent)
Requires:       perl(Mojo::Util)
Requires:       perl(Net::IP)
Requires:       perl(NetAddr::IP)
Requires:       perl(POSIX)
Requires:       perl(Perl::Critic::Freenode)
Requires:       perl(Regexp::Common)
Requires:       perl(Selenium::Chrome)
Requires:       perl(Selenium::Remote::Driver)
Requires:       perl(Selenium::Remote::WDKeys)
Requires:       perl(Selenium::Waiter)
Requires:       perl(Storable)
Requires:       perl(Term::ANSIColor)
Requires:       perl(Test::Assert)
Requires:       perl(Tie::IxHash)
Requires:       perl(Time::HiRes)
Requires:       perl(XML::LibXML)
Requires:       perl(XML::Simple)
Requires:       perl(XML::Writer)
Requires:       perl(YAML::PP)
Requires:       perl(constant)
Requires:       perl(parent)
Requires:       perl(strict)
Requires:       perl(utf8)
Requires:       perl(version)
Requires:       perl(warnings)
# END AUTOGENERATED DEPENDENCY LIST
Recommends:     os-autoinst-devel

%description
Metapackage that contains the dependencies of os-autoinst-distri-opensuse.

%prep

%build

%install

%check

%files

%changelog