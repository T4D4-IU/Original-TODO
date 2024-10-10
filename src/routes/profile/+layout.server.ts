import { redirect, type RequestEvent } from '@sveltejs/kit';
import { PUBLIC_CORBADO_PROJECT_ID } from '$env/static/public';
import { CORBADO_API_SECRET, CORBADO_FRONTEND_API, CORBADO_BACKEND_API } from '$env/static/private';
import { SDK, Config } from '@corbado/node-sdk';

const config = new Config(PUBLIC_CORBADO_PROJECT_ID, CORBADO_API_SECRET, CORBADO_FRONTEND_API, CORBADO_BACKEND_API);
const sdk = new SDK(config);

export async function load({ request }: RequestEvent) {
    const cookies = parseCookies(request.headers.get('Cookie') || '');
    const cbo_short_session: string | undefined = cookies.cbo_short_session;
    if (!cbo_short_session) {
        // return { id: undefined }
        redirect(302, '/');
    }
    try {
        const user = await sdk.sessions().validateToken(cbo_short_session);

        return {
            id: user.userId,
            name: user.fullName
        };
    } catch {
        // return { id: undefined }
        redirect(302, '/')
    }
}

function parseCookies(cookieHeader: string): Record<string, string> {
    return Object.fromEntries(
        cookieHeader.split(';').map((cookie) => {
            const [name, ...rest] = cookie.trim().split('=');
            return [name, rest.join('=')];
        })
    );
}