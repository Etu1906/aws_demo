.\mvnw clean install -DskipTests
Install-Module -Name AWS.Tools.Installer -Force
Install-Module -Name AWSPowerShell -Force

msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
aws --version

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
Import-Module AWSPowerShell
Set-AWSCredential -AccessKey AKIAUYTCISLVF2L56F6U -SecretKey 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 -StoreAs ralph
$ecrLoginCommand = Get-ECRLoginCommand -ProfileName ralph
$ecrLoginCommand = Get-ECRLoginCommand -ProfileName ralph -Region us-west-2
Get-AWSCredentials -ProfileName ralph
$ecrLoginCommand.Password | docker login --username AWS --password-stdin $ecrLoginCommand.ProxyEndpoint
@REM (Get-ECRLoginCommand -ProfileName ralph -Region us-west-2).Password | docker login --username AWS --password-stdin public.ecr.aws/b9y7r0v7/demo
docker build -t demo .
docker tag demo:latest public.ecr.aws/b9y7r0v7/demo:latest
docker push demo:latest public.ecr.aws/b9y7r0v7/demo:latest
aws ecr describe-repositories --region  us-west-2
aws configure get region
aws configure set region us-west-2
aws ecr list-images --repository-name learn --region us-west-2


aws configure
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/b9y7r0v7

docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/b9y7r0v7

