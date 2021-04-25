const github = require('@actions/core');

async function run() {
    const { issue_number, github_token, owner, repo, website_link } = process.env

    const octokit = new github.GitHub(github_token);

    try {
        const { data } = await octokit.issues.createComment({
            owner,
            repo,
            issue_number,
            body: `[Review website here](${website_link.replace(/"/gs, '')})`
        });

    } catch (err) {
        throw err
    }
}

run();



// import * as core from '@actions/core';
// import * as github from '@actions/github';
//
// export async function run() {
//     try {
//         const { issue_number, github_token, owner, repo, website_link } = process.env
//
//         if (github.context.payload.action !== 'opened') {
//             console.log('No issue or pull request was opened, skipping');
//             return;
//         }
//
//         const client: github.GitHub = new github.GitHub(github_token);
//         await client.issues.createComment({
//             owner: owner,
//             repo: repo,
//             issue_number: issue_number,
//             body: `[Review website here](${website_link.replace(/"/gs, '')})`
//         });
//     }
//     catch (error) {
//         core.setFailed(error.message);
//         throw error;
//     }
// }
//
// run();