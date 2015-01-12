# docker-jira-postgres

A PostgreSQL container ready to be used with [docker-jira](https://github.com/ahaasler/docker-jira "docker-jira repo").

## Usage

1. Create and name the database container:

	```bash
docker run --name jira-postgres -d ahaasler/jira-postgres
	```

2. Use it in the Jira container:

	```bash
docker run --name jira --link jira-postgres:jira-postgres -d -p 8080:8080 ahaasler/jira
	```

3. Connect your Jira instance following the Atlassian documentation: [Configure your JIRA server to connect to your PostgreSQL database](https://confluence.atlassian.com/display/JIRA/Connecting+JIRA+to+PostgreSQL#ConnectingJIRAtoPostgreSQL-3.ConfigureyourJIRAservertoconnecttoyourPostgreSQLdatabase "Configure your JIRA server to connect to your PostgreSQL database").
	* _Database Type_: PostgreSQL.
	* _Hostname_: jira-postgres (the name of the link between containers).
	* _Port_: 5432.
	* _Database_: jiradb (or the one specified as JIRA_DB_NAME).
	* _Username_: jira (or the one specified as JIRA_DB_USER).
	* _Password_: password (or the one specified as JIRA_DB_PASS).
	* _Schema_: public

> See [docker-jira](https://github.com/ahaasler/docker-jira "docker-jira repo") for more information on the jira container.

### Parameters

You can use these environment variables to configure your jira postgres instance:

* **JIRA_DB_NAME:** The name of your PostgreSQL database (default: `jiradb`).
* **JIRA_DB_USER:** The user for JIRA to connect to the PostgreSQL server (default `jira`).
* **JIRA_DB_PASS:** The password that JIRA should use to authenticate with the PostgreSQL server (default `password`).

They should be passed to the `docker run` command:

```bash
docker run --name jira-postgres -d -e JIRA_DB_NAME=jiradatabase -e JIRA_DB_USER=jiradbuser -e JIRA_DB_PASS=p455w0rd ahaasler/jira-postgres
```

## Thanks

* [Docker](https://www.docker.com/ "Docker") for this amazing container engine.
* [PostgreSQL](http://www.postgresql.org/) for this advanced database.
* [Atlassian](https://www.atlassian.com/ "Atlassian") for making great products. Also for their work on [atlassian-docker](https://bitbucket.org/atlassianlabs/atlassian-docker "atlassian-docker repo") which inspired this.
* [Azul Systems](http://www.azulsystems.com/ "Azul Systems") for their *OpenJDK* docker base image.
* And specially to you and the entire community.

## License

This image is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the full license text.
