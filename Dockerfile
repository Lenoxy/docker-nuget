FROM mcr.microsoft.com/powershell

# All files from the files/ folder are copied into the root directory
WORKDIR /root/
COPY files/* /root/

# required to install mono-devel, as one of its dependencies asks for timezone settings
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install dependencies
RUN apt-get update
RUN apt install -y --no-install-recommends ca-certificates curl gpg mono-devel

# Set bash alias
RUN echo "alias nuget='mono /root/nuget.exe'" >> /root/.bashrc

# Set pwsh alias
RUN touch /opt/microsoft/powershell/7/Microsoft.PowerShell_profile.ps1
RUN echo "function nuget {mono /root/nuget.exe}" >> /opt/microsoft/powershell/7/Microsoft.PowerShell_profile.ps1

ENTRYPOINT [ "pwsh" ]
