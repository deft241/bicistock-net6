﻿using System.Data;
using System.Data.SqlClient;
using Bicistock.Data.Data.DbContext;

namespace Bicistock.Data.Data.Repositories
{
    public class EventRepository
    {
        private ConnectionManager conexion = new ConnectionManager();
        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();


        public DataTable MostrarEvento()
        {

            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "MostrarEventos";
            comando.CommandType = CommandType.StoredProcedure;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            return tabla;

        }

        public void InsertarEvento(string descipcion, string imagen, int Brand)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "InsertarEventos";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Description", descipcion);
            comando.Parameters.AddWithValue("@imagen", imagen);
            comando.Parameters.AddWithValue("@Brand", Brand);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();
        }
    }
}
