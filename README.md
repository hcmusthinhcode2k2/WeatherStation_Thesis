## Thesis Topic: "Design a weather monitoring station using NB-IoT technology"

### Description
The weather station model was designed over a 5-month period (March 2024 - August 2024), incorporating components such as PCB, sensors, and mechanical structure. The objective of this project is to develop a station capable of collecting weather data from various sensors and transmitting it to the ThingsBoard server. This enables visualization of the collected data, facilitating effective weather monitoring.

The project benefited from equipment and guidance provided by RPC, the company where I interned from October 2023 to December 2023.

### Technology
- **Hardware**: Designed using the open-source software KiCad 8.0.
- **Firmware**: Developed for the PIC32MM0256GPM048 microcontroller, leveraging existing RPC libraries such as Telit, Bootloader, and VCP_debug. Tools used include MPLAB X IDE version 6.20 and Serial Port Terminal version 1.5.0.4.
- **Server**: ThingsBoard is utilized to create a website with widgets for visualizing weather data, GPS-based map locations, warning clocks, and more.

### Model Images and Implementation Results
#### Weather Station Board
![Weather Station Board](https://github.com/hcmusthinhcode2k2/WeatherStation_Thesis/blob/main/Picture_demo/Board.jpg)

#### Device Images
![Device Images](https://github.com/hcmusthinhcode2k2/WeatherStation_Thesis/blob/main/Picture_demo/Device.png)

#### ThingsBoard Dashboard
![ThingsBoard Dashboard](https://github.com/hcmusthinhcode2k2/WeatherStation_Thesis/blob/main/Picture_demo/Thingsboard.png)
- [Access the ThingsBoard Dashboard](https://demo.thingsboard.io/dashboard/4821b720-32a0-11ef-9229-f3aa570680fb?publicId=11060700-0c1c-11ef-b68a-bfe4060367e5)

### Developed After Defending The Thesis
Post-thesis, I built a web application using Next.js, integrating it with the ThingsBoard API for interactive weather data visualization. Supabase is used for backend services, including authentication via GitHub, data management, and real-time updates. The development process was influenced by insights from this [YouTube video](https://www.youtube.com/watch?v=zOgFMPC12Ag).
![Web](https://github.com/hcmusthinhcode2k2/WeatherStation_Thesis/blob/main/Picture_demo/app.png)
- [Access the Web](https://iot-dashboard-2r98-git-master-hcmusthinhcode2k2s-projects.vercel.app/auth)
- **Test Credentials**: 
  - **Username**: test1@gmail.com
  - **Password**: Test123@
