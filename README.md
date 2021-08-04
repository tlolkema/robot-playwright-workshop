# Robot Framework Workshop

**Resource:** Rein van der Vegt (https://github.com/Reinaard)

**Resource:** Tim Lolkema (https://github.com/tlolkema/)

# Preperations

### Installation

- Install python3 and put it in the path. (atleast python 3.6 or any newer version)
- Download chromedriver and put it in the path: https://chromedriver.chromium.org/
- Clone the Github repository: https://github.com/tlolkema/robot-workshop/

Open the terminal and go to the location of the repository and run:
- run: python -m venv env
- activate virtual env, run:
    - source env/bin/activate (Mac / Linux)
    - env\Scripts\activate (Windows)
- pip install -r requirements.txt

> If you have both installed a python2 and python3 version create the python virtualenv with "python3 -m venv env" to enforce python3.

### Running the Workshop Application

Open a new terminal and go to the location of the repository:
- activate virtual env, run:
    - source env/bin/activate (Mac / Linux)
    - env\Scripts\activate (Windows)
- Navigate to the 'app' directory
- python app.py
- The app will be running on http://localhost:5000/
- Check if you can go to the workshop application, after submitting your name the application should welcome you.

### Code editor

In this workshop you can work with any code editor.
Our recommendation for a quick and easy start is Visual Studio Code.

- Install Visual Studio Code (https://code.visualstudio.com/)
- Within Visual Studio Code, go to Extensions and install 'Robot Framework Intellisense'

This will give you syntax highlighting and navigation to keyword definitions.
