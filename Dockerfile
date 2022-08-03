FROM ubuntu

LABEL "maintainer"="A.Z." "appname"="Digital.RHB Technology Radar"

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/smolelf/rhb_technology_radar.git

RUN cd rhb_technology_radar

WORKDIR /rhb_technology_radar

RUN apt-get install -y npm

#RUN npm install fs-extra

RUN npm i aoe_technology_radar

RUN npx aoe_technology_radar-buildRadar

RUN npm run build && npx aoe_technology_radar-generateJson

CMD cd build && python3 -m http.server 8080

EXPOSE 8080