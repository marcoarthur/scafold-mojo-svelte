<script>
  import config from './config.js';

  let message = "";
  let response = "";

  async function callEcho() {
    const res = await fetch(`${config.API_HOST}/v1/api/echo?message=${encodeURIComponent(message)}`);
    const data = await res.json();
    response = data.echo;
  }
</script>

<main>
  <h1>Mojo + Svelte Echo Demo</h1>

  <input bind:value={message} placeholder="Type a message..." />
  <button on:click={callEcho}>Echo</button>

  {#if response}
    <p>Server responded: <strong>{response}</strong></p>
  {/if}
</main>

<style>
  main {
    font-family: sans-serif;
    max-width: 600px;
    margin: 2rem auto;
  }
  input, button {
    padding: 0.5rem;
    margin-right: 0.5rem;
  }
</style>
