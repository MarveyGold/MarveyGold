<script>
  import favicon from "$lib/assets/favicon.svg";

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href="icon.png" />
  <title>Marvellous Eromosele</title>
</svelte:head>

{@render children()}
