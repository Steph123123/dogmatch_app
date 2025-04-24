# 🐶DogMatch App

Una aplicación móvil desarrollada con Flutter que te permite descubrir razas de perros compatibles con diferentes tipos de personalidad humana.

Una forma divertida y educativa de fomentar la tenencia responsable de mascotas y guiar a las personas que finalmente deciden tener una mascota a encontrar a tu compañero perruno ideal.

## 📱 Características

* **Pantalla de Lista de Personalidades:** Muestra una lista de diferentes tipos de personalidad con una imagen representativa y un breve nombre.
* **Pantalla de Detalles de la Personalidad:** Al seleccionar una personalidad de la lista, se navega a una pantalla que muestra una descripción más detallada de esa personalidad y una lista de razas de perros compatibles.
* **Información de Razas de Perros:** Para cada raza compatible, se muestra su nombre, una imagen (obtenida de The Dog API), temperamento y esperanza de vida.
* **Integración con The Dog API:** La aplicación utiliza The Dog API para obtener información e imágenes de las diferentes razas de perros en tiempo real.
* **Diseño Adaptativo:** La interfaz de usuario está diseñada para ser funcional y adaptable en diferentes tamaños de pantalla de dispositivos móviles.
* **Arquitectura sencilla, adaptable y mantenible basada en división de responsabilidades.**

## 🛠️ Tecnologías utilizadas

* **Flutter:** Framework de desarrollo de UI de Google para construir aplicaciones multiplataforma.
* **Dart:** Lenguaje de programación utilizado por Flutter.
* **VSC:** IDE usado para el desarrollo de la app.
* **Android Studio:** Usado como emulador de la app.
* **The Dog API (thedogapi.com):** API pública utilizada para obtener información sobre razas de perros e imágenes.
* **http (paquete de Flutter):** Utilizado para realizar peticiones HTTP a The Dog API.
* **logger (paquete de Flutter):** Utilizado para el registro de eventos y depuración.

## 🛠️ Arquitectura

La aplicación sigue una arquitectura bastante similar al patrón MVC basada en la separación de responsabilidades con el fin de que sea facil de entender, extender y mantener con la diferencia que no hay una capa “controladora” como intermediaria para “controlar” la entrada de los usuarios. Buscamos tener widgets pequeños y especializados.

Los componentes principales son los siguientes:

* `models/personality.dart`: Define la clase `Personality` y la lista de personalidades (humanas) precargadas con sus descripciones y razas compatibles.
* `logic/dog_api.dart`: Contiene la clase `DogApi` que encapsula la lógica para interactuar con The Dog API (realizar búsquedas de razas y obtener imágenes).
* `screens/list_screen.dart`: Implementa la pantalla que muestra la lista de personalidades.
* `screens/detail_screen.dart`: Implementa la pantalla que muestra los detalles de una personalidad seleccionada y las razas de perros compatibles con su información e imágenes.
* `widgets/personality_tile.dart`: Define un widget reutilizable para mostrar cada elemento de la personalidad en la lista.

## 🚀 Cómo ejecutar el proyecto

1.  Asegúrate de tener Flutter instalado en tu sistema. Puedes seguir las instrucciones en [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install).
2.  Clona este repositorio.
3.  Navega al directorio raíz del proyecto en tu terminal.
4.  Obtén las dependencias del proyecto ejecutando:
    ```bash
    flutter pub get
    ```
5.  Ejecuta la aplicación en un emulador o dispositivo físico conectado:
    ```bash
    flutter run
    ```

## ✨ Notas sobre el desarrollo

* Esta app fue desarrollada como parte de un ejercicio técnico. Por cuestiones de tiempo, se tomaron algunas decisiones simplificadas (mantener una arquitectura sencilla pero eficiente, introduciendo una pantalla inicial con recursos locales, haciendo las llamadas a la api en la pantalla detallada añadiendo una segunda lista con razas compatibles y sus características).

* Sin embargo, se priorizó un código legible, ordenado y fácilmente escalable.

* Esta app está basada en mi sentimiento de responsabilidad como veterinaria y ahora desarrolladora para con los animales y la tenencia responsable de mascotas.

## 👤 Autora

Stephanía Alvarez

[GitHub](https://github.com/Steph123123)

[LinkedIn](https://www.linkedin.com/in/stephaniaalvarezwebdeveloper/)