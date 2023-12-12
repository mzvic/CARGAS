webtalk_init -webtalk_dir /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.hw/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Fri Dec  1 17:22:41 2023" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "Vivado v2016.1 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "1538259" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "labtool" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "7be3991b27705ecaaf0571742e2fcad0" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "ad579e91-175f-430a-937a-6219441e63c4" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "6" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 22.04.3 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "AMD Ryzen 3 5300U with Radeon Graphics" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "1400.000 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "6.000 GB" -context "user_environment"
webtalk_register_client -client labtool
webtalk_add_data -client labtool -key pgmcnt -value "00:00:00" -context "labtool\\usage"
webtalk_add_data -client labtool -key cable -value "" -context "labtool\\usage"
webtalk_transmit -clientid 4272749120 -regid "" -xml /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.hw/webtalk/usage_statistics_ext_labtool.xml -html /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.hw/webtalk/usage_statistics_ext_labtool.html -wdm /home/mzvic/CARGAS/PT100/tempsensordriver/tempsensordriver.hw/webtalk/usage_statistics_ext_labtool.wdm -intro "<H3>LABTOOL Usage Report</H3><BR>"
webtalk_terminate
