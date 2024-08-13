#!/usr/bin/env node

async function getPlaylistDanceability(authToken, playlistId) {
  const baseUrl = "https://api.spotify.com/v1";
  const headers = {
    Authorization: `Bearer ${authToken}`,
    "Content-Type": "application/json",
  };

  async function fetchTracks(url) {
    const response = await fetch(url, { headers });
    const data = await response.json();
    return data.items.map((item) => ({
      name: item.track.name,
      id: item.track.id,
    }));
  }

  async function fetchAudioFeatures(trackId) {
    const response = await fetch(`${baseUrl}/audio-features/${trackId}`, {
      headers,
    });
    const data = await response.json();
    return data.danceability;
  }

  try {
    let allTracks = [];
    let tracksUrl = `${baseUrl}/playlists/${playlistId}/tracks`;

    // Fetch all tracks (handling pagination)
    while (tracksUrl) {
      const response = await fetch(tracksUrl, { headers });
      const data = await response.json();
      allTracks = allTracks.concat(
        data.items.map((item) => ({
          name: item.track.name,
          id: item.track.id,
        }))
      );
      tracksUrl = data.next;
    }

    // Fetch danceability for each track
    const tracksWithDanceability = await Promise.all(
      allTracks.map(async (track) => {
        const danceability = await fetchAudioFeatures(track.id);
        return { ...track, danceability };
      })
    );
    return tracksWithDanceability.sort(
      (a, b) => b.danceability - a.danceability
    );
  } catch (error) {
    console.error("Error:", error);
    throw error;
  }
}

// CLI
if (require.main === module) {
  const [authToken, playlistId] = process.argv.slice(2);

  if (!authToken || !playlistId) {
    console.error("Usage: node script.js <authToken> <playlistId>");
    console.log(
      "To get your auth token, go to the Spotify Web API docs, log in, then run an example request and inspect network request (https://developer.spotify.com/documentation/web-api/reference/get-audio-features)"
    );
    process.exit(1);
  }
  getPlaylistDanceability(authToken, playlistId)
    .then((tracks) => {
      console.log(tracks);
    })
    .catch((error) => {
      console.error("Error:", error);
    });
}
