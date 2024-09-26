FROM python:3.10

WORKDIR /the_workdir

COPY requirements.txt .

COPY b_script.sh .

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY ./mace ./mace

RUN pip install ./mace

RUN git clone https://github.com/davkovacs/BOTNet-datasets.git

RUN git clone https://github.com/BingqingCheng/ab-initio-thermodynamics-of-water.git

RUN wget --no-check-certificate http://www.quantum-machine.org/gdml/data/xyz/md17_benzene2017.zip

RUN unzip md17_benzene2017.zip

CMD /the_workdir/b_script.sh