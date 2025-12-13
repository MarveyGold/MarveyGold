<script>
  import Js from "$lib/Icons/js.svelte";
  import Ts from "$lib/Icons/ts.svelte";
  import Send from "$lib/Icons/send.svelte";
  import Github from "$lib/Icons/github.svelte";
  import Git from "$lib/Icons/git.svelte";
  import Gmail from "$lib/Icons/gmail.svelte";
  import Whatsapp from "$lib/Icons/whatsapp.svelte";
  import React from "$lib/Icons/react.svelte";
  import Favicon from "$lib/assets/favicon.svg";

  let { data } = $props();
  let info = $state(data);
  let subject = $state();
  let mail = $state();
  let active = $state("mail");
  let nav = $state();
  function handleChange(e) {
    mail = e.target.value;
  }

  function submit(e) {
    e.preventDefault();
    console.log(mail);

    const Subject = encodeURIComponent(subject);
    const Mail = encodeURIComponent(mail);
    if (active === "mail") {
      window.location.href = `mailto:osoidaghemarvel@gmail.com?subject=${Subject}&body=${Mail} `;
    } else if (active === "whatsapp") {
      window.location.href = `https://api.whatsapp.com/send?phone=2349045394806&text=${Mail}`;
    }
  }
</script>

<main>
  <header>
    <nav>
      <button onclick={() => (nav == "open" ? (nav = "") : (nav = "open"))}
        ><h2>≡</h2></button
      >
      <ul class={nav}>
        <a href="#home"><li>Home</li></a>
        <a href="#about"><li>About</li></a>
        <a href="#projects"><li>Projects</li></a>
        <a href="#contact"><li>Contact</li></a>
      </ul>
    </nav>
  </header>

  <header class="title">
    <h3 class="blue">Marvellous Osoidaghe</h3>
  </header>
  <section id="home">
    <div>
      <img src="/image.png" alt="" />
    </div>

    <div class="hero">
      <h1>
        Hi, I'm Marvellous - <span class="bold">Front-End</span> Web and Mobile
        App
        <span class="bold"> Developer</span>
      </h1>
      <p>
        I build interactive web apps that captivate users and boost online
        visibility
      </p>
      <span>
        <button class="cta1"><b>Hire Me</b></button>
        <button class="cta2"><b>Download Resume</b></button>
      </span>
    </div>
  </section>
  <section id="about" style="justify-content: space-between; width: 100vw;">
    <div>
      <h1>About Me</h1>
      <h4>
        Experienced in building responsive web applications, from utilities like
        scientific calculators to learning platforms (ExaminU) and promotional
        websites (Fast Logistics). Proficient in modern technologies like
        Next.js (App Router), React Native and Sveltekit
      </h4>
    </div>
    <div class="about-right">
      <img src="/image.png" alt="" />
      <span style="display: flex; gap: 10px; margin-left: 2vw">
        <button class="cta1">HTML</button><button class="cta2">CSS</button
        ><button class="cta1">JS</button>
      </span>
    </div>
  </section>
  <section id="projects">
    <div id="Work">
      <div>
        <h1>My Projects</h1>
      </div>
      <br />
      <marquee behavior="scroll" direction="left" scrollamount="2">
        <div class="project-list">
          {#each info.projects as project}
            <div class="box">
              <h5 class="project-title">{project.title}</h5>
              <h6 class="detail">{@html project.description}</h6>
              <span>
                <a href={project.link}
                  ><button class="cta1"> View Project</button></a
                >
                {#if project.source}
                  <a href={project.source}
                    ><button class="cta2"><Github /> View code</button>
                  </a>
                {/if}
              </span>
            </div>
          {/each}
        </div>
      </marquee>
    </div>
    <div id="stack">
      <h2>Skills</h2>
      <marquee behavior="scroll" direction="right" scrollamount="4">
        <div class="stackList">
          <button> <Js /> JAVASCRIPT</button>
          <button><Ts />TYPESCRIPT</button>
          <button><React />REACT</button>
          <button>NEXTJS(APP ROUTER)</button>
          <button>SVELTE</button>

          <button><Git />GIT & <Github /> GITHUB</button>
        </div>
      </marquee>
    </div>
  </section>
  <section id="contact">
    <!-- <h4>Connect with Me Va:</h4> -->
    <!-- <span><span>LinkedIn</span><span>X</span><span>Github</span></span> -->
    <h4>Contact Me</h4>
    <span class="sponsors">
      <form class="form" id="mail" onsubmit={submit}>
        <span>
          <label for="name">Name:</label>
          <input
            type="text"
            bind:value={subject}
            name="name"
            placeholder="Enter your name"
          />
        </span>
        <span>
          <label for="message">Message:</label>
          <textarea
            bind:value={mail}
            name="message"
            placeholder="Write your message"
            required
          ></textarea>
        </span>

        <button type="submit" class="btn">Send<Send /></button>
      </form>
      <p></p>
    </span>
    <div class="sponsors">
      <span>
        <button
          onclick={() => (active = "mail")}
          style={active === "mail"
            ? "opacity: 2; color: white; border-radius: 20px; font-weight: bold; width: 30vw;"
            : "opacity: 0.5; width: 20vw; border-radius: 20px; "}
          ><Gmail /></button
        >
        <button
          onclick={() => (active = "whatsapp")}
          style={active === "whatsapp"
            ? "opacity: 2; color: white; border-radius: 20px; font-weight: bold; width: 30vw;"
            : "opacity: 0.5; width: 20vw; border-radius: 20px; "}
          ><Whatsapp /></button
        >
      </span>
    </div>
  </section>
  <footer>© 2025 Marvellous Osoidaghe. Built using Sveltekit</footer>
</main>

<style>
  nav button {
    border: none;
    background: transparent;
    cursor: pointer;
    display: none;
  }
  a {
    text-decoration: none;
  }
  li {
    list-style: none;
  }
  .her {
    position: absolute;
    left: 2px;
  }
  header {
    display: flex;
    justify-content: space-between;
    margin: 20px;

    width: 85vw;
    top: 5vh;
    z-index: 100;
  }
  .title {
    position: absolute;
    top: 10vh;
    height: 20vh;
  }
  h3 {
    position: sticky;
    top: -5vh;
  }
  nav,
  nav ul {
    display: flex;
    flex-direction: row;
    gap: 50px;
    position: fixed;
    right: 10vw;
    z-index: 5;
  }
  nav ul li {
    color: #581c87;
  }
  #home {
    display: flex;
    flex-direction: row-reverse;
    background-image: url("/image.png");
    background-size: cover;
    background-position: center;
  }
  #home::before {
    content: "";
    position: absolute;
    inset: 0;
    backdrop-filter: blur(18px);
    background: rgba(0, 0, 0, 0, 0.55);
    height: 120vh;
  }
  div {
    z-index: 2;
  }
  span {
    display: flex;
  }
  section {
    height: 100vh;
    width: 100vw;
    display: flex;
    padding-top: 10vh;
    align-items: center;
  }
  #home div img {
    width: 40vw;
    border-radius: 40vw;
    margin-top: 40px;
    z-index: -1;
  }
  button {
    padding: 15px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  #home div p {
    font-size: 0.75rem;
    color: var(--bold);
    animation: typing 10s steps(70) forwards;
    width: max-content;
    mask: linear-gradient(90deg, #000 0%, #000 0%, transparent 0%);
    -webkit-mask: linear-gradient(90deg, #000 0%, #000 0%, transparent 0%);
  }

  @keyframes typing {
    to {
      mask: linear-gradient(90deg, #000 100%, #000 100%, transparent 100%);
      -webkit-mask: linear-gradient(
        90deg,
        #000 100%,
        #000 100%,
        transparent 100%
      );
    }
  }

  .cta2 {
    background-color: white;
    border: 5px solid #581c87;
    padding: 10px;
  }
  .cta1,
  .stackList button {
    background-color: #581c87;
    color: white;
    border: 1px solid black;
  }
  .stackList {
    display: flex;
  }
  .about-right {
    width: 50vw;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  .about-right img {
    width: 15vw;
    border-radius: 15vw;
  }
  #Work {
    flex-direction: column;
  }
  #projects {
    flex-direction: column;
  }
  marquee {
    width: 90vw;
  }
  .project-list {
    display: flex;
    flex-direction: row;
  }
  .box {
    margin: 20px;
    width: 25vw;
    height: 40vh;
    border-width: 1px;
    border-color: grey;
    border-radius: 40px;
    border-style: solid;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    white-space: normal;
    background-color: #1e293b;
  }
  .detail {
    height: 20vh;
  }
  .form {
    display: flex;
    flex-direction: column;
    background-color: #1e293b;
    justify-content: center;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
    width: 80vw;
    justify-content: center;
    align-items: center;
    height: 13rem;
    padding: 5vw;
  }
  .form input,
  .form textarea {
    width: 70vw;
    border-radius: 2rem;
    padding: 0.5rem;
    background-image: linear-gradient(white, rgb(242, 226, 238));
    color: #0a0a0a;
    border: 1px solid #ccc;
    margin-top: 5px;
  }
  textarea {
    height: 10vh;
  }
  #contact {
    background-color: #1e293b;
    margin-left: 5vw;
    width: 90vw;
    height: 80dvh;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
    border-radius: 20px;
    padding: 20px 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
  .hero h1 {
    color: var(--bg);
  }
  .form button {
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(#7a5cfa, var(--bg));
    color: var(--bold);
    padding: 7px;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    transition:
      background-color 0.3s ease,
      transform 0.3s ease;
    margin-top: 5px;
    width: 50vw;
    align-self: center;
  }
  footer {
    text-align: center;
    padding: 1rem 0;
    font-size: 0.9rem;
    color: #aaa;
    border-top: 1px solid rgba(250, 250, 250, 0.1);
    margin-top: 3rem;
  }
  @media (max-width: 700px) {
    nav button {
      display: flex;
    }
    .open {
      display: flex;
      flex-direction: column;
      position: absolute;
      right: 3vw;
      gap: 10px;
      top: 7vh;
    }
    nav ul {
      display: none;
    }
    #home {
      flex-direction: column;
    }
    #home div img {
      width: 80vw;
      border-radius: 80vw;
      margin-top: 40px;
      z-index: -1;
    }
    .title {
      position: absolute;
      top: 1vh;
      height: 20vh;
    }
    .box {
      width: 75vw;
      flex-shrink: 0;
    }
    .about-right {
      display: none;
    }
    #about div h4 {
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }
</style>
