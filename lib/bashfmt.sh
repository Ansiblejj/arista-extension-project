Name:           my-arista-tools
Version:        1.0.0
Release:        1
Summary:        Combined Arista EOS Extensions (Python, Cython, and ZTP)
License:        Proprietary
BuildArch:      x86_64
# Ensure your build system has these
BuildRequires:  meson, python3-devel, gcc

%description
This package contains high-performance Cython modules, standard automation 
scripts, and ZTP templates for Arista EOS.

%install
# 1. Run the Meson install to your build root
# This handles the compiled .pyx (.so) and .py files defined in meson.build
cd %{_builddir}/..
DESTDIR=%{buildroot} meson install -C builddir

# 2. Manually install any "loose" extensions like .cpy or .sw scripts
mkdir -p %{buildroot}/usr/share/my-extensions/templates
cp scripts/bootstrap.cpy %{buildroot}/usr/share/my-extensions/templates/

%files
# Include the compiled Cython binary and Python scripts
/usr/lib/python3*/site-packages/my_extensions/
# Include the ZTP and other data extensions
/usr/share/my-extensions/templates/bootstrap.cpy
