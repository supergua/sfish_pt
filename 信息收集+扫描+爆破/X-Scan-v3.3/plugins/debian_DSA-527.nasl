# This script was automatically generated from the dsa-527
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15364);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "527");
 script_cve_id("CVE-2004-0456");
 script_bugtraq_id(10633);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-527 security update');
 script_set_attribute(attribute: 'description', value:
'Ulf Härnhammar discovered a vulnerability in pavuk, a file retrieval
program, whereby an oversized HTTP 305 response sent by a malicious
server could cause arbitrary code to be executed with the privileges
of the pavuk process.
For the current stable distribution (woody), this problem has been
fixed in version 0.9pl28-1woody1.
pavuk is no longer included in the unstable distribution of Debian.
We recommend that you update your pavuk package.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2004/dsa-527');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2004/dsa-527
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:H/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA527] DSA-527-1 pavuk");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-527-1 pavuk");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'pavuk', release: '3.0', reference: '0.9pl28-1woody1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
