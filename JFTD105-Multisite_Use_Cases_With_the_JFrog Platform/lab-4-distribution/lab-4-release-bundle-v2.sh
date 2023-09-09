jf c use swampup

#release bundle v2 creation
jf rbc --builds=rbv2-build.json --signing-key=MYKEY-GPG myPaymentApp 2.0.1

#release bundle promotion
jf rbp myPaymentApp 2.0.1 PROD