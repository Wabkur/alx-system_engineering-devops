postmortem

Issue Summary
Duration: 2024-10-01, 2:00 PM - 5:00 PM UTC (3 hours)

On October 1, 2024, from 2:00 PM to 5:00 PM UTC, our web platform experienced a partial outage. Approximately 60% of users were unable to access key services, including account login and payment processing, while others faced slow response times. The root cause was traced to a misconfigured MySQL database user privilege, which prevented certain queries from executing correctly. This resulted in degraded functionality for high-traffic portions of the site.

Timeline
1:55 PM: Issue detected via an alert from the monitoring system, indicating slow query execution times.
2:00 PM: A customer service ticket reported login failures.
2:05 PM: Engineers began investigating MySQL query logs for anomalies.
2:15 PM: An assumption was made that the issue was related to server load. The team checked CPU, memory, and disk usage.
2:30 PM: Misleading path: Engineers adjusted MySQL query configurations, assuming they were causing performance bottlenecks.
3:00 PM: After no improvement, the issue was escalated to the database administration team.
3:20 PM: The DBA team identified a permissions misconfiguration affecting the hbnb_dev MySQL user.
3:30 PM: Engineers applied a temporary fix by granting missing privileges.
4:00 PM: Full functionality restored after privileges were corrected and tested.
5:00 PM: Monitoring confirmed that all systems were operating normally.
Root Cause and Resolution
The root cause was a misconfigured MySQL user privilege for the hbnb_dev user. When the database administrator updated the system during routine maintenance, an incorrect command was used to modify user permissions, inadvertently revoking the SELECT privilege from the hbnb_dev user. This caused query failures for certain critical tables, impacting services that required these database reads, such as user authentication and payment processing.

Corrective and Preventative Measures
Improvements/Preventative Steps:

Database User Auditing: Implement periodic audits of user privileges to catch misconfigurations early.
Automated Alerts: Set up granular monitoring to detect permission errors in the database.
Rollback Mechanism: Introduce a rollback mechanism for database configurations during maintenance periods.
Tasks to Address the Issue:

Add a database monitoring alert specifically for permission-related issues.
Set up a test environment to simulate database permission changes before deployment.
Update internal documentation with a checklist for safe database configuration changes.
Train all engineers on database privilege management, ensuring knowledge of how privilege changes can affect production systems.
This incident highlighted the importance of both thorough monitoring and regular audits in maintaining system stability during routine updates.