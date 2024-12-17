output "alb_dns_name" {
    value = aws_lb.webserver-lb.dns_name
    description = "The domain name of the LB"
}