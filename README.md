aws machine connect using aws ssm command 
```
aws ssm start-session --target <instance-id>
```

start and stop instance 
```
aws ec2 start-instances --instance-ids <instance-id>
aws ec2 stop-instances --instance-ids <instance-id>
```
