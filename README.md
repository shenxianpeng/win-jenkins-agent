# Semi-automatic setup of Jenkins Agent on Windows

[![Test](https://github.com/shenxianpeng/win-jenkins-agent/actions/workflows/test.yml/badge.svg)](https://github.com/shenxianpeng/win-jenkins-agent/actions/workflows/test.yml)

To config a windows agent as a Jenkins node is very annoying and often encounters various problems.

I created this repository to make it easier to set up the Jenkins agent as a service on Windows.

## Getting started

### Download dependencies

For example: if your Remote root directory of Windows agent is `C:\agent`

Then just git clone this repo and run `main.bat` under Remote root directory.

```bat
cd C:\agent
git clone https://github.com/shenxianpeng/win-jenkins-agent.git && cd win-jenkins-agent

main.bat
```

### Manual update configuration

Before install `jenkins-agent.exe` as a service, you need to update `jenkins-agent.xml` following attributes.

* `<executable>`

    path to java.exe. for example `<executable>C:\agent\jdk-11.0.2\bin\java.exe</executable>`

* `<arguments>`

    `<arguments> -jar agent.jar -jnlpUrl http://your-jenkins-hostname:8080/computer/your-windows-agent-name/jenkins-agent.jnlp -secret d194c768ff6379a8a4ccde6fe98d67ee7b02bc2afb5b3e0517722643c39bff87 -workDir "C:\agent"</arguments>`

    You can find this arguments on Jenkins.

    Node -> Configure -> Launch method, chose "Launch agent by connecting it to the master".

    Then you will see ![arguments](images/arguments.png).

### Register as a service

Install as service

```bat
C:\agent>jenkins-agent.exe install
2022-09-06 21:06:51,629 INFO  - Installing service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)'...
2022-09-06 21:06:51,659 INFO  - Service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)' was installed successfully.
```

Start service

```bat
C:\agent>jenkins-agent.exe start
2022-09-06 21:06:56,850 INFO  - Starting service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)'...
2022-09-06 21:06:57,285 INFO  - Service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)' started successfully.
```

More commands to run

```bat
C:\agent>jenkins-agent.exe --help
```

## References

* How to Install Jenkins Agent on Windows YouTuBe [video](https://youtu.be/N8AQTlHoBKc)
* How to install Windows agents as a service? [article](https://support.cloudbees.com/hc/en-us/articles/217423827-How-to-install-Windows-agents-as-a-service-).
