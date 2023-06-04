﻿using Bicistock.Common.Models;
using Bicistock.Data.Data;
using Bicistock.Data.Data.Repositories;
using System.Data;

namespace Bicistock.Domain.Services
{
    public class EventService
    {
        public List<Event> MostrarEventos()
        {
            EventRepository accesoBD = new EventRepository();
            List<Event> CitationList = new List<Event>();
            DataTable datos = new DataTable();

            datos = accesoBD.MostrarEvento();
            foreach (DataRow item in datos.Rows)
            {
                CitationList.Add(new Event(item));
            }
            return CitationList;
        }

        public void InsertarEvento(string descipcion, string imagen, int Brand)
        {
            EventRepository accesoBD = new EventRepository();

            accesoBD.InsertarEvento(descipcion, imagen, Brand);
        }

    }
}
