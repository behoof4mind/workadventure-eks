# workadventure-eks
https://github.com/thecodingmachine/workadventure infrastructure based on AWS EKS solution

## How to use
1. Create AWS account. [AWS Free Tier](https://aws.amazon.com/free/?trk=ps_a134p000003yLSaAAM&trkCampaign=acq_paid_search_brand&sc_channel=PS&sc_campaign=acquisition_RU&sc_publisher=Google&sc_category=Core&sc_country=RU&sc_geo=EMEA&sc_outcome=acq&sc_detail=%2Baws%20%2Baccount&sc_content=Account_bmm&sc_segment=444212697008&sc_medium=ACQ-P%7CPS-GO%7CBrand%7CDesktop%7CSU%7CAWS%7CCore%7CRU%7CEN%7CText&s_kwcid=AL!4422!3!444212697008!b!!g!!%2Baws%20%2Baccount&ef_id=Cj0KCQjwyZmEBhCpARIsALIzmnL98vW027VMl5eeYAT3LA0nUzOF-skeLa1PEB8jJqpGgj0Zm1LC4HUaAn8xEALw_wcB:G:s&s_kwcid=AL!4422!3!444212697008!b!!g!!%2Baws%20%2Baccount&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)
2. Register domain. [Register a Domain Name with Amazon Route 53](https://aws.amazon.com/getting-started/hands-on/get-a-domain/)
3. Change variables in [main.tf](./terraform/main.tf) file if you need
4. Change variables in [helmfile.yaml](./helmfile.yaml) file if you need
5. Change terraform backend config to your own [Terraform S3 backend](https://www.terraform.io/docs/language/settings/backends/s3.html), [How to manage Terraform state](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa)
6. Set **AWS_ACCESS_KEY_ID** and **AWS_SECRET_ACCESS_KEY** secrets in GitHub project settings
7. Start workflow `Prepare EKS environment` workflow in Github Actions
8. Copy kubectl config from terraform output and put it as **KUBE_CONFIG_DATA_BASE64** secret to GitHub project settings
9. Start workflow `Deploy app` workflow in Github Actions
10. When worflow will finish - check `http://front.<YOUR-DOMAIN-NAME>` page (http://front.workadventure-game.link in this example)
11. You should see web page with workadventure app
