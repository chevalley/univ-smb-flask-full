from flask import Flask
from mysql.connector import DataBase, InterfaceError, connect

def connexion(host: str, bdd: str, login: str, mdp: str):
    try:
        cnx = mysql.connector.connect(
            host=host,
            user=user,
            password=mdp,
            database=bdd,
        )
        print(f"Connexion Réussie")
        return cnx

    except mysql.connector.Error as err:
        print (f"Erreur de Connexion à la base de données: {err}")