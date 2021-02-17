+++
title = "Database setup"
date = 2021
weight = 2
chapter = false
pre = "<b>2. </b>"
+++

Let’s now take a look at the database that is set up. We have already seeded the database, but it is good practice to check that the seed worked correctly.

**Contents**
- [3.1. Assume-Role - **ec2-admin-team-alpha**](#31-assume-role---ec2-admin-team-alpha)
- [3.2. Create EC2 with/without Tags](#32-create-ec2-withwithout-tags)
- [3.3. Edit Resource Tag of EC2 Instance](#33-edit-resource-tag-of-ec2-instance)
- [3.4. EC2 Instance Management](#34-ec2-instance-management)

#### Connect to the database

1. In your windows workspace, open a command prompt

2. Type the following command in the command prompt replacing the <rds_host> section with your actual RDS endpoint and without the angled braces, < and >.

```bash
mysql -u root --password=labpassword -h <rds_host>
```

{{% notice tip %}}
The password for the MySQL instance is labpassword, as shown above.
{{% /notice %}}

#### Seed the database

1. Download [this database seed script](https://workshops.devax.academy/monoliths-to-microservices/module1/files/DB.sql) as a file. Open the file in a text editor and copy the contents.

{{%attachments title="Database File" pattern=".*(sql)"/%}}

{{% notice note %}}
An alternative to cut and paste is to use the secure copy (scp) command instead. This will scp the file over to the server and you can run it inside the mysql instance:
{{% /notice %}}

```bash
# from your local dev machine
scp -i ee-default-keypair.pem DB.sql ec2-user@<JUMPSERVERIPADDRESS>:
# on the jump server once you are ssh onto it
mysql> source /home/ec2-user/DB.sql;
```

2. **Paste** the contents of your clipboard into the ssh session.
A number of tables are created and populated with data in the **TravelBuddy MySQL database**. This data will be used by the application you will install in later steps.

3. Type ```exit``` and **press enter** to exit the mysql session.

4. Type ```exit``` and **press enter** to exit the ssh session.



#### View the data in the database

1. You should now see the mysql> prompt.

2. We have already set up a database for you called travelbuddy. We need to select it by typing the following command:

```sql
use travelbuddy
```

You should see the message “Database changed”

3. The database has already been seeded for you with two tables. To display the tables, type the following:

```sql
show tables;
```

This should display the names of the two tables

{{% notice info %}}
If you do not see any database or tables, please let a facilitator know.
{{% /notice %}}