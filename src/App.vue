<template>
  <div class="container">

    <div class="title-wrapper">
      <h1 class="title">
        {{ displayedText }}<span class="cursor">|</span>
      </h1>
    </div>

    <section class="projects">

      <div class="project">
        <div>
          <h2>Medisch AI Platform</h2>

          <p>
            SOAP-artsenportaal met een AI-model voor medische voorspellingen op basis van vitale waarden.
          </p>

          <h3 class="tools-title">Tools:</h3>

          <div v-if="stage < 1" class="spinner"></div>

          <div v-if="stage >= 1" class="tool-images">
            <img
                v-for="(t, i) in project1Tools"
                :key="t"
                class="tool-image"
                :class="{ visible: i < icons1 }"
                :src="getImage(t)"
                alt="tool"
            />
          </div>

          <ul v-if="stage >= 2" class="tool-list">
            <li
                v-for="(t, i) in project1List"
                :key="t"
                :class="{ visible: i < list1 }"
            >
              {{ t }}
            </li>
          </ul>
        </div>

        <a
          class="btn"
          href="https://medical.maurits-portfolio.nl/"
          target="_blank"
          rel="noopener noreferrer"
        >View project</a>
      </div>

      <div class="project">
        <div>
          <h2>Fullstack Film Webshop</h2>

          <p>
            Film webshop met gepersonaliseerde filmaanbevelingen, collectie en bestelproces.
          </p>

          <h3 class="tools-title">Tools:</h3>

          <div v-if="stage < 1" class="spinner"></div>

          <div v-if="stage >= 1" class="tool-images">
            <img
                v-for="(t, i) in project2Tools"
                :key="t"
                class="tool-image"
                :class="{ visible: i < icons2 }"
                :src="getImage(t)"
                alt="tool"
            />
          </div>

          <ul v-if="stage >= 2" class="tool-list">
            <li
                v-for="(t, i) in project2List"
                :key="t"
                :class="{ visible: i < list2 }"
            >
              {{ t }}
            </li>
          </ul>
        </div>

        <a
          class="btn"
          href="https://films.maurits-portfolio.nl/"
          target="_blank"
          rel="noopener noreferrer"
        >View project</a>
      </div>

      <div class="project">
        <div>
          <h2>Revit Bibliotheek</h2>

          <p>
            WPF desktop-app voor het doorzoeken en beheren van Revit-families op een netwerkschijf-bibliotheek.
          </p>

          <h3 class="tools-title">Tools:</h3>

          <div v-if="stage < 1" class="spinner"></div>

          <div v-if="stage >= 1" class="tool-images">
            <span
                v-for="(t, i) in project3Tools"
                :key="t"
                class="tool-image"
                :class="{ visible: i < icons3 }"
            >
              <img :src="getImage(t)" alt="tool" />
            </span>
          </div>

          <ul v-if="stage >= 2" class="tool-list">
            <li
                v-for="(t, i) in project3List"
                :key="t"
                :class="{ visible: i < list3 }"
            >
              {{ t }}
            </li>
          </ul>
        </div>

        <a
          class="btn"
          href="/revit-bibliotheek/"
          target="_blank"
          rel="noopener noreferrer"
        >View project</a>
      </div>

    </section>

    <footer class="footer">
      <span>Email: mauritsschelvis87@gmail.com</span>
      <span>Telefoonnummer: 0633866035</span>
      <span>
        LinkedIn:
        <a
          href="https://www.linkedin.com/in/maurits-schelvis-9107113aa/?skipRedirect=true"
          target="_blank"
          rel="noopener noreferrer"
        >Profiel</a>
      </span>
    </footer>

  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

import pythonImg from './assets/python.png'
import angularImg from './assets/angular.png'
import fastapiImg from './assets/fast-api.png'
import numpyImg from './assets/numpy.png'
import pandasImg from './assets/pandas.png'
import scikitImg from './assets/scikit.png'
import springbootImg from './assets/springboot.png'
import postgresImg from './assets/postgres.png'
import csharpImg from './assets/csharp.svg'
import dotnetImg from './assets/dotnet.svg'
import wpfImg from './assets/wpf.svg'
import sqliteImg from './assets/sqlite.svg'

const fullText = 'My Projects'
const displayedText = ref('')
let i = 0

const stage = ref(0)

const icons1 = ref(0)
const icons2 = ref(0)
const icons3 = ref(0)
const list1 = ref(0)
const list2 = ref(0)
const list3 = ref(0)

const project1Tools = ['Python', 'Scikit', 'Pandas', 'NumPy', 'Angular', 'FastAPI']

const project2Tools = ['Angular', 'Spring Boot', 'FastAPI', 'PostgreSQL']

const project3Tools = ['C#', '.NET', 'WPF', 'SQLite']

const project1List = ['Python', 'Scikit-learn', 'Pandas', 'NumPY', 'Angular', 'FastAPI']
const project2List = ['Angular', 'FastAPI', 'Spring Boot', 'PostgreSQL']
const project3List = ['C#', '.NET 10', 'WPF', 'SQLite']

const getImage = (name) => {
  switch (name) {
    case 'Python': return pythonImg
    case 'Angular': return angularImg
    case 'FastAPI': return fastapiImg
    case 'NumPy': return numpyImg
    case 'Pandas': return pandasImg
    case 'Scikit': return scikitImg
    case 'Spring Boot': return springbootImg
    case 'PostgreSQL': return postgresImg
    case 'C#': return csharpImg
    case '.NET': return dotnetImg
    case 'WPF': return wpfImg
    case 'SQLite': return sqliteImg
    default: return pythonImg
  }
}

onMounted(() => {
  const type = setInterval(() => {
    displayedText.value += fullText[i]
    i++
    if (i >= fullText.length) clearInterval(type)
  }, 35)

  setTimeout(() => {
    stage.value = 1

    project1Tools.forEach((_, i) => {
      setTimeout(() => icons1.value = i + 1, i * 90)
    })

    project2Tools.forEach((_, i) => {
      setTimeout(() => icons2.value = i + 1, i * 90)
    })

    project3Tools.forEach((_, i) => {
      setTimeout(() => icons3.value = i + 1, i * 90)
    })

  }, 700)

  setTimeout(() => {
    stage.value = 2

    project1List.forEach((_, i) => {
      setTimeout(() => list1.value = i + 1, i * 70)
    })

    project2List.forEach((_, i) => {
      setTimeout(() => list2.value = i + 1, i * 70)
    })

    project3List.forEach((_, i) => {
      setTimeout(() => list3.value = i + 1, i * 70)
    })

  }, 1700)
})
</script>