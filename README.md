Amazon RDS (Relational Database Service) is its own Database Instance managed by AWS, and separate from Amazon Elastic Cloud Compute (EC2). You are allowed to connect to and EC2 but RDS is a fully managed service that provides many features beyond hosting a database. 

Features:

-Fully automated provisioning of the database.
-Automated patching of the underlying operating system.
-Continuous backups with the ability to restore to a specific timestamp, known as Point in Time Restore.
-Monitoring dashboards to view database performance.
-Support for read replicas to improve read performance.
-Multi-AZ deployments for disaster recovery.
-Maintenance windows for upgrades.
-Scaling capabilities both vertically (increasing instance type) and horizontally (adding read replicas).
-Storage backed by Elastic Block Store (EBS).
-One limitation is that you cannot SSH into the RDS instances because AWS manages the underlying infrastructure.

###RDS Storage Auto Scaling Feature:

A notable feature of RDS is Storage Auto Scaling. When creating an RDS database, you specify the initial storage size, for example, 20 gigabytes. If your database usage grows and you approach the storage limit, RDS can automatically increase the storage size without requiring manual intervention or downtime.

This feature is especially useful for applications with unpredictable workloads. The auto scaling triggers when:

-Free storage is less than 10% of the allocated storage.
-The low storage condition persists for more than five minutes.
-At least six hours have passed since the last storage modification.
-You must set a maximum storage threshold to prevent unlimited growth. Storage Auto -Scaling supports all database engines managed by RDS

###RDS Multi AZ:

Multi AZ is primarily used for disaster recovery. The application performs reads and writes to a Master database instance located in availability zone A. There is synchronous replication to a standby instance in availability zone B. Every change made to the Master is synchronously replicated to the standby instance. 

This means that when the application writes to the Master, the change must also be replicated to the standby before it is accepted.

The setup provides a single DNS name for the database. The application connects to this DNS name, and in case of a failure with the Master, there is an automatic failover to the standby database. This increases availability and is the reason it is called Multi AZ. Failover can occur if an entire availability zone is lost, or if there is a network, instance, or storage failure on the Master database.

The standby database becomes the new Master without requiring manual intervention in the application, as long as the application retries the connection.

Multi AZ is not used for scaling. The standby database is only for failover purposes; it cannot be read from or written to during normal operation.

###Combining Read Replicas and Multi AZ:

It is possible to configure Read Replicas as Multi AZ for disaster recovery. 

###Transitioning from Single AZ to Multi AZ:

A common exam question is how to convert an RDS database from Single AZ to Multi AZ. This operation is zero downtime, meaning you do not need to stop the database. You simply modify the database instance and enable Multi AZ.

This causes the RDS database instance to have a Master and a standby database with synchronous replication, without any manual intervention beyond modifying the setting.

Behind the scenes, RDS takes a snapshot of the main database and restores it into a new standby database. Once restored, synchronization is established between the Master and standby databases. The standby catches up to the Master, completing the Multi AZ setup.

