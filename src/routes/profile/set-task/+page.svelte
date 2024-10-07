<script lang="ts">
    import type { PageData } from './$types';
    import Corbado from '@corbado/web-js';
    import type {SessionUser} from "@corbado/types";
    import { onMount } from 'svelte';
    let user: SessionUser | undefined;
    onMount(() => {
        user = Corbado.user
    });
    export let data: PageData;
</script>

<div>
    {#if user}
    <h1>Set Task</h1>
    <form method="POST">
        <label>
            add TODO:
            <input
            type="text"
            name="task"
            autocomplete="off"
            />
        </label>
    </form>
    {:else}
    <a href="/">Login</a>
    {/if}
</div>