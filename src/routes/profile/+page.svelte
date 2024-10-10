<script lang="ts">
    import type { PageData } from './$types';
    import Corbado from '@corbado/web-js';
    import { goto } from '$app/navigation';

    export let data: PageData

    async function handleLogout() {
        await Corbado.logout()
        await goto("/")
    }
</script>

<div>
    {#if (data.id)}
        <h1>
            Profile Page
        </h1>
        <p>
            User-id: {data.id}
            User-name: {data.name}
        </p>
        <a href="/profile/setting">set task</a>
        <a href="/profile/tasks">check tasks</a>
        <a href="/profile/archive">archivement</a>
        <button on:click={handleLogout}>
            Logout
        </button>
    {:else}
        <h1>
            You aren't logged in.
        </h1>
        <p>Go <a href="/">Home</a></p>
    {/if}
</div>