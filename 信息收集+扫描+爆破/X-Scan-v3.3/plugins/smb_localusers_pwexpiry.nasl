#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(10916);
 script_version("$Revision: 1.10 $");

 script_xref(name:"OSVDB", value:"755");

 name["english"] = "Local users information : Passwords never expire";

 script_name(english:name["english"]);

 script_set_attribute(attribute:"synopsis", value:
"At least one local user has a password that never expires." );
 script_set_attribute(attribute:"description", value:
"Using the supplied credentials, it is possible to list local users
whose passwords never expire." );
 script_set_attribute(attribute:"solution", value:
"Allow / require users to change their passwords regularly." );
 script_set_attribute(attribute:"risk_factor", value:"None" );
script_end_attributes();

 
 summary["english"] = "Lists local users whose passwords never expire";

 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 family["english"] = "Windows : User management";
 script_family(english:family["english"]);
 script_dependencies("smb_netusergetinfo_local.nasl");
 script_require_keys("SMB/LocalUsers/1");
 
 exit(0);
}


port = get_kb_item("SMB/transport");
if(!port)port = 139;


logins = "";
count = 1;
login = get_kb_item(string("SMB/LocalUsers/", count));
while(login)
{
 p = get_kb_item(string("SMB/LocalUsers/", count, "/Info/PassMustChange"));
 if(p)
 {
  exp = "0x7f-0xff-0xff-0xff-0xff-0xff-0xff-0xff";
  if(p == exp){
  	logins = string(logins, "  - ", login, "\n");
	}
 }
 count = count + 1;
 login = get_kb_item(string("SMB/LocalUsers/", count));
}

if(logins)
{
  if (max_index(split(logins)) == 1)
    report = "The following local user has a password that never expires :\n";
  else
    report = "The following local users have passwords that never expire :\n";

  report = string(
    "\n",
    report,
    "\n",
    logins
  );
  security_note(port:0, extra:report);
}
