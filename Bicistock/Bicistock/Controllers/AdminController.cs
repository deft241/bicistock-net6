﻿using Microsoft.AspNetCore.Mvc;
using Bicistock.Common.Models;
using Bicistock.Domain.Services;
using Bicistock.Controllers.Filters;
using Capa_Soporte.Helpers;

namespace Bicistock.Controllers
{
    [TypeFilter(typeof(AdminAuthorizationHandler))]
    public class AdminController : Controller
    {
        private IWebHostEnvironment Environment;

        public AdminController(IWebHostEnvironment _environment)
        {
            Environment = _environment;
        }

        public IActionResult Index()
        {
            return RedirectToAction("Panel");
        }

        public IActionResult Panel()
        {
            UserService UserEntity = new UserService();
            InventoryManager modeloGeneral = new InventoryManager();
            AdminPanelData objAdminPanel = new AdminPanelData();
            objAdminPanel.UserList = UserEntity.MostrarUsuarios();

            return View(objAdminPanel);
        }


        public IActionResult Citas()
        {
            AppointmentService conexionCita = new AppointmentService();
            AppointmentManager objModeloCita = new AppointmentManager();
            BrandService conexionMarca = new BrandService();
            List<Brand> marcas = new List<Brand>();

            objModeloCita.CitationList = conexionCita.MostrarCitas();

            return View(objModeloCita);
        }

        public IActionResult BorrarCita(int idCita)
        {
            AppointmentService conexionCita = new AppointmentService();
            Appointment objCita = new Appointment();
            UserService userService = new UserService();

            objCita = conexionCita.GetCitationById(idCita);
            conexionCita.Eliminar(idCita);

            User user = userService.MostrarUsuario(objCita.UserName);

            if (!string.IsNullOrEmpty(user.UserEmail))
            {
                Mail.SendRemoveAppointmentEmail(user.UserEmail);
            }
            return RedirectToAction("Citas");
        }



        public IActionResult CreateComponent()
        {
            BrandService conexionMarca = new BrandService();
            Brand Brand = new Brand();
            InventoryManager inventoryManager = new InventoryManager();

            inventoryManager.BrandList = conexionMarca.MostrarMarcas();


            return View(inventoryManager);
        }


        [HttpPost]
        public IActionResult CreateComponent(InventoryManager nuevoComponente)
        {
            Logger.Logger logger = new Logger.Logger();
            ComponentService conexionComponente = new ComponentService();
            string Name = nuevoComponente.Component.Name;
            string componenteImagen;
            string description = nuevoComponente.Component.Description;

            int BrandId = nuevoComponente.Component.BrandId;

            //Meter foto carpeta imagenes
            string wwwPath = Environment.WebRootPath;
            string contentPath = Environment.ContentRootPath;



            string path = Path.Combine(Environment.WebRootPath, "Images");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            List<string> uploadedFiles = new List<string>();


            string fileName = Path.GetFileName(nuevoComponente.Component.Component_Image_Upload.FileName);
            using (FileStream stream = new FileStream(Path.Combine(path, fileName), FileMode.Create))
            {

                nuevoComponente.Component.Component_Image_Upload.CopyTo(stream);
                uploadedFiles.Add(fileName);
                componenteImagen = "/Images/" + fileName;
                ViewBag.Message += string.Format("<b>{0}</b> uploaded.<br />", fileName);

                logger.Info("Se ha creado el Componente " + Name);
                conexionComponente.InsertarComponente(Name, BrandId, componenteImagen, description);
                return RedirectToAction("CreateComponent");
            }

        }

        public ActionResult CreateBike()
        {
            BrandService conexionMarca = new BrandService();
            Brand Brand = new Brand();
            InventoryManager objModelogeneral = new InventoryManager();

            objModelogeneral.BrandList = conexionMarca.MostrarMarcas();



            return View(objModelogeneral);


        }

        [HttpPost]
        public ActionResult CreateBike(InventoryManager nuevaBici)
        {
            Logger.Logger logger = new Logger.Logger();
            BikeService conexionBici = new BikeService();
            string name = nuevaBici.BikeEntity.Name;
            int brandId = nuevaBici.Brand.Id;
            string image;
            string? description = nuevaBici.BikeEntity.Description;

            //Meter foto carpeta imagenes
            string wwwPath = Environment.WebRootPath;
            string contentPath = Environment.ContentRootPath;



            string path = Path.Combine(Environment.WebRootPath, "Images");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            List<string> uploadedFiles = new List<string>();


            string fileName = Path.GetFileName(nuevaBici.BikeEntity.Image_upload.FileName);
            using (FileStream stream = new FileStream(Path.Combine(path, fileName), FileMode.Create))
            {

                nuevaBici.BikeEntity.Image_upload.CopyTo(stream);
                uploadedFiles.Add(fileName);
                image = "/Images/" + fileName;
                ViewBag.Message += string.Format("<b>{0}</b> uploaded.<br />", fileName);

                conexionBici.MeterBici(name, brandId, image, description);
                logger.Info("Se ha creado la bicicleta " + name);
                return RedirectToAction("CreateBike");
            }

        }





        public IActionResult CreateEvent()
        {


            BrandService conexionMarca = new BrandService();
            Brand Brand = new Brand();
            InventoryManager objModeloAdmin = new InventoryManager();

            objModeloAdmin.BrandList = conexionMarca.MostrarMarcas();


            return View(objModeloAdmin);
        }


        [HttpPost]
        public IActionResult CreateEvent(InventoryManager nuevoEvento)
        {
            Logger.Logger logger = new Logger.Logger();
            EventService conexionEvento = new EventService();
            string desc = nuevoEvento.Event.EventDescription;

            int BrandId = nuevoEvento.Brand.Id;

            conexionEvento.InsertarEvento(BrandId, desc, nuevoEvento.Event.MapURL);
            logger.Info("Se ha creado un nuevo Evento");
            HttpContext.Session.SetInt32("eventCreated", 1);
            return RedirectToAction("CreateEvent");


        }

        public IActionResult Productos()
        {

            BikeService conexionBici = new BikeService();
            ComponentService conexionComponente = new ComponentService();

            InventoryManager objModeloGeneral = new InventoryManager();

            objModeloGeneral.BikeList = conexionBici.BiciMarca();
            objModeloGeneral.ComponentList = conexionComponente.MostrarComponente();


            return View(objModeloGeneral);
        }

        public IActionResult Eventos()
        {
            EventService conexionCita = new EventService();
            InventoryManager objModeloGeneral = new InventoryManager();

            objModeloGeneral.EventList = conexionCita.MostrarEventos();

            return View(objModeloGeneral);
        }

    }
}