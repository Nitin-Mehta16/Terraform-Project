output "lb" {
  value = aws_lb.tf-alb.id
}
output "lb-sg" {
   value=aws_security_group.tf-lb-sg.id
}

output "lb-tg" {
  value = aws_lb_target_group.tf-lb_target_group.id
}

# output "lb-tg-ec2" {
#   value = aws_lb_target_group_attachment.tf-lb_target_group_attachment.target_id
# }
output "lb-tg-ec2" {
  value = [for i in aws_lb_target_group_attachment.tf-lb_target_group_attachment : i.target_id]
}

output "lb-dns_name" {
  value = aws_lb.tf-alb.dns_name
}
