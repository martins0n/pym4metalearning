FROM docker.pkg.github.com/martins0n/python3.6-r3.6-devtools/python3.6-r3.6-devtools:latest

RUN Rscript -e 'install.packages("forecast", dependencies=TRUE)' \
    && Rscript -e 'install.packages("logger", dependencies=TRUE)'

RUN mkdir app

WORKDIR app

COPY ./Rrequierements/installPackages.R ./Rrequierements/installPackages.R
COPY ./requirements.txt ./requirements.txt
RUN Rscript  ./Rrequierements/installPackages.R  \
    && python3.6 -m pip install --upgrade pip setuptools && python3.6 -m pip install -r requirements.txt

COPY ./ ./

CMD ["bash"]
