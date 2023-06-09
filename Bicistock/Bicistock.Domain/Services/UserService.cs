﻿using Bicistock.Common.Models;
using Bicistock.Data.Data.Repositories;
using Capa_Soporte.Helpers;
using System.Data;

namespace Bicistock.Domain.Services
{
    public class UserService
    {
        //Show an User
        public User MostrarUsuario(string UserName)
        {
            Logger.Logger logger = new Logger.Logger();
            UserRepository accesoBD = new UserRepository();

            User UserEntity;

            DataTable datos = new DataTable();

            datos = accesoBD.MostrarUsuario(UserName);


            if (datos.Rows.Count == 0)
            {
                UserEntity = new User();
                UserEntity.UserName = null;
                return UserEntity;
            }
            else
            {
                UserEntity = new User(datos.Rows[0]);
                return UserEntity;
            }

        }
        //Show all Users
        public List<User> MostrarUsuarios()
        {
            UserRepository accesoBD = new UserRepository();
            List<User> UserList = new List<User>();
            DataTable datos = new DataTable();

            datos = accesoBD.MostrarTodos();
            foreach (DataRow item in datos.Rows)
            {
                UserList.Add(new User(item));
            }
            return UserList;
        }

        //Creates a new User
        public void CrearUsuario(string username, string password, string Dni, string name, string surnames, int age,
            string phone, string verified, byte idPermission, string email)
        {
            UserRepository accesoBD = new UserRepository();

            if (Dni == null)
            {
                Dni = string.Empty;
            }
            if (surnames == null)
            {
                surnames = string.Empty;
            }
            if (phone == null)
            {
                phone = string.Empty;
            }

            accesoBD.Insertar(username, password, Dni, name, surnames, age, phone, verified, idPermission, email);
        }

        //Activate an User
        public void ActivateUser(string username)
        {
            UserRepository accesoBD = new UserRepository();

            accesoBD.ActivateUser(username);
        }

        //Check if login was succesfull
        public bool LoginValidator(string username, string password)
        {
            //Check any null parameter
            if (username == null || username == string.Empty || password == null || password == string.Empty)
            {
                return false;
            }
            else
            {
                //Create new user entity
                User userEntity = MostrarUsuario(username);

                //Decrypt Password
                if (userEntity.Password == Encrypt.GetSHA256(password))
                {
                    //Authorized
                    return true;
                }
                else
                {
                    //No match
                    return false;
                }
            }
        }

        //Modify data of an User
        public bool ModifyUser(User newUserData, string userName)
        {
            UserRepository userRepository = new UserRepository();
            DataTable dataTable = new DataTable();

            User oldUserData = new User(userRepository.MostrarUsuario(userName).Rows[0]);

            if (string.IsNullOrEmpty(newUserData.UserEmail))
            {
                newUserData.UserEmail = oldUserData.UserEmail;
            }
            if (string.IsNullOrEmpty(newUserData.UserName))
            {
                newUserData.UserName = oldUserData.UserName;
            }
            if (string.IsNullOrEmpty(newUserData.Surnames))
            {
                newUserData.UserName = oldUserData.Surnames;
            }
            if (string.IsNullOrEmpty(newUserData.Name))
            {
                newUserData.UserName = oldUserData.Name;
            }
            if (newUserData.Age == 0)
            {
                newUserData.Age = oldUserData.Age;
            }
            if (string.IsNullOrEmpty(newUserData.Dni))
            {
                newUserData.Dni = oldUserData.Dni;
            }
            if (string.IsNullOrEmpty(newUserData.Password))
            {
                newUserData.Password = oldUserData.Password;
            }
            if (newUserData.Role == 0 || newUserData.Role == null)
            {
                newUserData.Role = oldUserData.Role;
            }
            if (string.IsNullOrEmpty(newUserData.Verified))
            {
                newUserData.Verified = oldUserData.Verified;
            }
            if (string.IsNullOrEmpty(newUserData.Phone))
            {
                newUserData.Phone = oldUserData.Phone;
            }

            return userRepository.UpdateUser(newUserData);
        }

    }
}
