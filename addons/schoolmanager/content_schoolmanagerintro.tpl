<h2>{t escape=no}Introduction to GOsa2's School Manager Add-On{/t}</h2>

<h3>{t}General Information{/t}</h3>

<p>
	{t}The SchoolManager Add-On for GOsa2 has been designed as an advanced LDAP import tool for user and group management at schools. In our experience, schools have several special needs uncommon to other IT setups, e.g.:{/t}
</p>
<ul>
	<li>{t}Many users come and go every year.{/t}
	<li>{t}Group memberships may change every half year.{/t}
	<li>{t}Each student comes with parents that are also involved in school IT (e.g., home page login).{/t}
	</ul>
<p>
	{t}With this SchoolManager Add-On you can mass create user accounts for teachers, students and parents via importing two (large) CSV files. Most school offices run school administration tools, that can provide such CSV files as required by GOsa2's SchoolManager Add-On.{/t}
</p>

<p>
	{t}From the CSV file, various information gets extracted:{/t}
</p>

<ul>
	<li>{t}Personal data (name, date of birth, unique ID as stored in the school administration software){/t}
	<li>{t}Teachers: class teacher, taught subjects, taught courses{/t}
	<li>{t}Students: each student normally comes with one or two parents that also may need accounts in LDAP{/t}
	<li>{t}Students and teachers are grouped by classes and courses{/t}
	<li>{t}Students and their parents are bound together via parent groups{/t}
	<li>{t}Mail addresses of teachers, students and parents.{/t}
</ul>

<h3>SchoolManager is idempotent</h3>

<p>
	{t}The import algorithm in SchoolManager is idempotent. This means you can import the same CSV file several times without endangering already existing accounts. If some of the information in the CSV file has changed, the correlating LDAP objects (users/groups) will be adapted.{/t}
</p>

<h3>Nothing Gets Deleted...</h3>

<p>
	{t}In SchoolManager, there is this concept of not deleting any LDAP information, ever.{/t}
</p>

<p>
	{t}POSIX (UniX) user accounts and POSIX groups always have their representation on the servers' file system level. Files and folders in home and group directories are owned by a specific user and a specific group. Technically, the mapping between users/groups and file system permissions happens through numbers: UID number, GID number.{/t}
</p>

<p>
	{t}If accounts / groups get removed from LDAP, it may occur that UID numbers and GID numbers of removed users and groups get re-used for new LDAP user accounts or LDAP groups. This might lead to unwanted access to data on the file system level. The new user can potentially access files created by the removed user who formerly owned the new user's UID number. Same, in theory, applies for groups and GID numbers. {/t}
</p>

<p>
	{t escape=no}SchoolManager's solution to this is: keep all user and group objects in LDAP forever. User objects (i.e. their user ID) can be renamed with the &quot;Archive Accounts&quot; module, so that nice and short user IDs stay available on your school site.{/t}
</p>

<h3>{t}First time usage{/t}</h3>

<p>
{t}If you are using the SchoolManager Add-On for GOsa2 for the first time, please follow these steps:{/t}

<ul>
<li>{t}First, finish up reading all information provided by this introduction.{/t}
<li>{t}Then, change to the Directory Structure Management view of GOsa2{/t}
<li>{t escape=no}Create a GOsa² Department with the name &quot;SchoolManager&quot; at a location of your choice within the LDAP tree.{/t}
<li>{t escape=no}Return to the SchoolManager Add-On again and start importing students and/or teachers. When switching to the &quot;Student Management&quot; or the &quot;Teacher Management&quot; tabs, you will find more information on the requirements regarding the CSV import files.{/t}
</ul>

<h3>{t}Preparing a new School Year{/t}</h3>

<p>
	{t}SchoolManager creates various groups (POSIX groups, LDAP DN groups) on user import. These groups get stored at a special location of the LDAP tree.{/t}
</p>
<p>
	{t}With the start of a new school year, it is recommended to flush group members from all these groups, i.e. class, course, subject and parent groups. At the beginning of a new school year, we recommend emptying all groups managed by this plugin with an import of all teachers first and flush all group members during this import.{/t}</p>
</p>

<table>
	<tr>
		<td style="width: 1em;">&nbsp;</td>
		<td style="vertical-align: middle;">
			<LABEL for="ou_groups">{t}OU container for groups managed by SchoolManager:{/t}</LABEL>
		</td>
		<td style="width: 1em;">&nbsp;</td>
		<td style="vertical-align: middle;">
			<select id="ou_groups" name="ou_groups" size="1" title="">
			{html_options options=$ous_available selected=$preset_ou_groups}
			</select>
		</td>
	</tr>

	<tr>
		<td style="width: 1em;">&nbsp;</td>
		<td style="vertical-align: top;">
			{t}Flush all members from course, class, subject and parent groups now? If you click this button, SchoolManager presents to you a list of to be emptied groups and asks for confirmation before actually performing this clean-up task.{/t}
		</td>
		<td style="width: 1em;">&nbsp;</td>
		<td style="vertical-align: bottom;">
		<button name="empty_schoolmanager_groups_now" type="submit">Empty all SchoolManager groups now!</button>
		</td>
	</tr>
</table>

<h3>{t}Localization and Regional Adaptations{/t}</h3>

<p>
	{t}The SchoolManager add-on for GOsa2 has been developed with the German school system in mind, more specifically the school system as found in the Nothern German county Schleswig-Holstein.{/t}
</p>
<p>
	{t}If you intend using SchoolManager on your GOsa² site but find that it does not at all fill you needs, this may be due to regional differences in how schools get administered all over the world. Don't give up, SchoolManager can be adapted/extended to your needs.{/t}
</p>
<p>
	{t}Please get in touch with the GOsa2 developers on Github and we will see, what we can do for you:{/t}
	<a target="_new" href="https://github.com/gosa-project/gosa-plugin-schoolmanager">
	https://github.com/gosa-project/gosa-plugin-schoolmanager</a>
</p>

<input type="hidden" name="ignore">