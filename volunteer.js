const ctx = document.querySelector('.activity-chart');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
        datasets: [{
            label: 'Time',
            data: [3, 1.4, 2.5, 4, 3, 2, 4],
            backgroundColor: '#1e293b',
            borderWidth: 3,
            borderRadius: 6,
            hoverBackgroundColor: '#60a5fa'
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            x: {
                border: {
                    display: true
                },
                grid: {
                    display: true,
                    color: '#1e293b'
                }
            },
            y: {
                ticks: {
                    display: false
                }
            }
        },
        plugins: {
            legend: {
                display: false
            }
        },
        animation: {
            duration: 1000,
            easing: 'easeInOutQuad',
        }
    }
});

window.addEventListener("load", () => {
document.body.classList.add("loaded");
});

// =================================================================
// 🚀 AI AUTO-SEARCH FOR RELATED VIDEOS (YOUTUBE DATA API)
// =================================================================

// Your provided YouTube Data API Key
const YOUTUBE_API_KEY = 'AIzaSyC8dC0zUnZ0zPu7H4iVulFwHFXHHqCwBMs'; // <-- NEW KEY IS HERE

// The search query is designed to find highly relevant training content
const AI_SEARCH_QUERY = 'inclusive volunteer training and accessibility best practices';
const MAX_RESULTS = 3; // Number of related videos to display

/**
 * Fetches video results from the YouTube Data API.
 */
async function fetchRelatedVideos() {
    const API_URL = `https://www.googleapis.com/youtube/v3/search?part=snippet&q=${encodeURIComponent(AI_SEARCH_QUERY)}&type=video&maxResults=${MAX_RESULTS}&key=${YOUTUBE_API_KEY}`;
    
    try {
        const response = await fetch(API_URL);
        if (!response.ok) {
            // Check for common API errors (e.g., key restrictions, daily limit)
            const errorData = await response.json();
            console.error("YouTube API Failure Details:", errorData);
            throw new Error(`YouTube API error: ${response.status} - ${errorData.error.message || response.statusText}`);
        }
        const data = await response.json();
        renderVideos(data.items);
    } catch (error) {
        console.error("❌ Failed to fetch YouTube videos. Please check the Console for details. The key might be invalid or improperly restricted.", error);
        document.getElementById('dynamic-resource-list').innerHTML = 
            '<p style="color: red; text-align: center; padding: 20px;">⚠️ **Error loading resources.** Check the console for API key or restriction issues.</p>';
    }
}

// ... (rest of the renderVideos and initializeActivityChart functions remain the same)
// ... (Make sure the full, unmodified code from the previous working response is here)

function renderVideos(videos) {
    const container = document.getElementById('dynamic-resource-list');
    if (!container) return;
    
    container.innerHTML = ''; // Clear the "Loading" message

    if (videos.length === 0) {
        container.innerHTML = '<p style="text-align: center; color: #777; padding: 20px;">No related training videos found for the current query.</p>';
        return;
    }

    videos.forEach(video => {
        const videoId = video.id.videoId;
        const title = video.snippet.title;
        const channelName = video.snippet.channelTitle;
        // Truncate and clean up the description
        let description = video.snippet.description.replace(/\n/g, ' ').substring(0, 100).trim();
        if (video.snippet.description.length > 100) {
            description += '...';
        }

        const thumbnailUrl = video.snippet.thumbnails.medium.url;
        const videoUrl = `https://www.youtube.com/watch?v=${videoId}`;
        
        // Build the HTML structure for each video resource
        const resourceHTML = `
            <img src="${thumbnailUrl}" alt="${title}" style="width: 100%; border-radius: 8px; margin-top: 15px;">
            <div class="audio" style="display: flex; align-items: center; margin-top: 10px;">
                <i class='bx bx-video' style="font-size: 20px; color: #e74c3c;"></i>
                <a href="${videoUrl}" target="_blank" title="${title}" style="margin-left: 8px; font-weight: bold;">Video: ${title}</a>
            </div>
            <p style="margin: 5px 0 10px 0; font-size: 0.9em; color: #555;">${description}</p>
            <div class="listen" style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                <div class="author" style="display: flex; align-items: center;">
                    <div style="margin-left: 10px;">
                        <p style="font-weight: 600; font-size: 0.85em;">Channel: ${channelName}</p>
                    </div>
                </div>
                <a href="${videoUrl}" target="_blank" style="text-decoration: none;">
                    <button style="background: #3498db; color: white; border: none; padding: 8px 15px; border-radius: 5px; cursor: pointer;">
                        Watch<i class='bx bx-right-arrow-alt' style="margin-left: 5px;"></i>
                    </button>
                </a>
            </div>
            <hr style="border: 0; border-top: 1px solid #eee; margin: 20px 0;">
        `;

        container.insertAdjacentHTML('beforeend', resourceHTML);
    });
}

function initializeActivityChart() {
    const ctx = document.querySelector('.activity-chart');
    if (ctx) {
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Hours',
                    data: [2, 5, 3, 6, 4, 0, 0],
                    backgroundColor: [
                        'rgba(52, 152, 219, 0.5)',
                        'rgba(46, 204, 113, 0.5)',
                        'rgba(241, 196, 15, 0.5)',
                        'rgba(52, 152, 219, 0.5)',
                        'rgba(46, 204, 113, 0.5)',
                        'rgba(231, 76, 60, 0.5)',
                        'rgba(231, 76, 60, 0.5)'
                    ],
                    borderColor: [
                        'rgba(52, 152, 219, 1)',
                        'rgba(46, 204, 113, 1)',
                        'rgba(241, 196, 15, 1)',
                        'rgba(52, 152, 219, 1)',
                        'rgba(46, 204, 113, 1)',
                        'rgba(231, 76, 60, 1)',
                        'rgba(231, 76, 60, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    },
                    title: {
                        display: true,
                        text: 'Weekly Activity'
                    }
                }
            }
        });
    }
}


// Call functions when the page loads
window.onload = function() {
    fetchRelatedVideos();
    initializeActivityChart(); 
};