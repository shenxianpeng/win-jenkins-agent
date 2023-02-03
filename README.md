# Semi-automatic setup of Jenkins Agent on Windows

Configuring the windows agent of jenkins is very annoying and often encounters various problems.

So I created this repository to automate the setup of Jenkins Agent on Windows.

## Getting start

### Run main.bat

For example your Remote root directory of Windows agent is `C:\agent`

So just git clone this repo and run `main.bat` under Remote root directory.

```bat
cd C:\agent
git clone https://github.com/shenxianpeng/win-jenkins-agent.git && cd win-jenkins-agent

main.bat
```

### Update `jenkins-agent.xml`

Before install `jenkins-agent.exe` as a service, need to update `jenkins-agent.xml` following attributes.

* `<executable>`

    path to java.exe. for example `<executable>C:\agent\jdk-11.0.2\bin\java.exe</executable>`

* `<arguments>`

    `<arguments> -jar agent.jar -jnlpUrl http://your-jenkins-hostname:8080/computer/your-windows-agent-name/jenkins-agent.jnlp -secret d194c768ff6379a8a4ccde6fe98d67ee7b02bc2afb5b3e0517722643c39bff87 -workDir "C:\agent"</arguments>`

    you can find this arguments on Jenkins. Node -> Configure -> Launch method, chose "Launch agent by connecting it to the master". then you will see ![arguments](images/arguments.png).

### Start `jenkins-agent.exe`

```bat
C:\agent>jenkins-agent.exe install
2022-09-06 21:06:51,629 INFO  - Installing service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)'...
2022-09-06 21:06:51,659 INFO  - Service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)' was installed successfully.

C:\agent>jenkins-agent.exe start
2022-09-06 21:06:56,850 INFO  - Starting service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)'...
2022-09-06 21:06:57,285 INFO  - Service 'Jenkins Agent for jenkins:8080 (jenkins8080agent)' started successfully.

# more commands
C:\agent>jenkins-agent.exe --help
```

## Reference

How to Install Jenkins Agent on Windows YouTuBe [video](https://youtu.be/N8AQTlHoBKc)

How to install Windows agents as a service? [article](https://support.cloudbees.com/hc/en-us/articles/217423827-How-to-install-Windows-agents-as-a-service-).
