<template>
  <div id="app">
    <div v-for="list in lists" v-bind:key="list.id">
      <h1>{{ list.name }}</h1>
    </div>
  </div>
</template>

<script>
export default {
  props: ["lists"]
};
</script>
