# Open4Collab

## Inspiration

We were inspired by issues we had ourselves with COVID-19 - we learned a ton about tech and coding and wanted to share our passion with others in software development, but hit a wall in finding others like ourselves. We were all too familiar with recruiting someone for a hackathon, only to have them ghost the team and scrambling last minute, or finding others to work on an opensource project with and then make all of the contributions. Simply finding someone with similar interests was difficult - you could go to hackathons, but what if you want to work more long-term? Enter Open4Collab - our solution to this problem. COVID-19 has taught many a new skill - but at the same time, made it apparent that finding dedicated collaborators on projects is difficult. Current social media is wonderful for meeting new people, but so dependent on first impressions - are they from your hometown, and do they have a pretty face. Open4Collab takes the first impressions out of a new person and focuses on what really counts - their projects. Whether it’s learning together, building the next big startup, or looking for developers to start an open-source project, Open4Collab uses machine learning to cluster similar projects with you.

## What it does

Open4Collab is a platform that, unlike current social media, allows for more active collaboration and in turn creates a lot more engagement. It does this by using the skills and interests you've listed to cluster you with projects that want to work with. It also works the other way, you can create a project where you require people with certain skills and get those people! Our model is easy to understand, it's not a black box like seen in so many sites today, you know what data you're giving. We want you to be aware that your skills are used with a k mean model in order to find projects that fit their specific interests and skill set. To understand which technologies are related, we downloaded all of StackOverflow's tags to find the correlation between them. If two technologies had questions asked together, they were more similar and should be matched together. Based on this, we generate a list of suitable projects for you which you can then contact the owner of. We believe social media should be engaging in people's lives in a positive way and it can do that by being a simple and transparent tool that encourages people to collaborate and connect.

## How we built it

In order for a chance at the @ Company prize, Open4Collab was built using the Flutter UI Framework, the @ platform and Firebase. The @ platform was used to give everyone a unique sign. Cloud Firestore was used to store project data and handle real-time updates. This ensured that our application would scale and stay responsive even with massive amounts of project data.

## Challenges we ran into

Using the @ protocol and a service like Firebase together while ensuring that the @ companies beliefs are still respected. We planned out the app so that user data is not stored on the cloud and instead managed using the @ platform, however, relevant data used for the cluster on the GCP still be stored there. We would have preferred was a solution that utilized GCP cloud functions that tied to the app platform in a permission-based manner but could not find support for this with the limited time.

## Accomplishments that we're proud of

Integrating the @ platform with are project was difficult but we kept working on it even after recording our demo and we eventually got it working (see project media). Also being able to successfully set up a Flutter UI and connect Firebase is something we're proud of. Most of us were not familiar with Flutter but now have a better understanding of its purpose and why it's growing in popularity.

## What we learned

We learned about Flutter and gained a better understanding of the Google Cloud Platform.

## What's next for Open4Collab - Social Media for Developers

We'll improve the UI and add more features based on user feedback
