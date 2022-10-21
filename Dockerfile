FROM mono:latest

WORKDIR /root
RUN curl -k https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -o nuget.exe
RUN echo 'alias nuget="mono /root/nuget.exe"' >> ~/.bashrc

ENTRYPOINT [ "bash" ]