---
title: Max Milne Photography
year: 2008 - 2024
description: Advertising and Fine Art Photography
order: 1
---

A complete ground-up rewrite of the VOICE platform with 50% better audio quality and 3x faster processing. VOICE 2 introduces real-time voice cloning and a modern web interface for non-technical users.

## What's new

**Voice cloning**: Upload 30 seconds of audio to create a custom voice model. The system extracts vocal characteristics and generates a personalized voice that maintains the speaker's unique qualities.

**Web interface**: Browser-based studio for voice synthesis without API knowledge. Features include voice preview, batch processing, and project management.

**Enterprise features**: Advanced analytics, usage quotas, team management, and white-label options for business customers.

## Architecture improvements

Migrated from TensorFlow to PyTorch for better model flexibility. Key upgrades:

- **Faster training**: New data pipeline reduces model training time from 48 to 8 hours
- **Better inference**: Optimized serving with TensorRT achieves 60ms latency (down from 180ms)
- **Memory efficiency**: 40% reduction in GPU memory usage through model quantization
- **Scalability**: Kubernetes deployment handles traffic spikes automatically

## User interface

Built with React and TypeScript, the web app provides:

```javascript
// Example API integration
const synthesis = await voiceAPI.create({
  text: "Welcome to VOICE 2",
  voice_id: "custom_voice_abc123",
  emotions: ["cheerful", "confident"],
  output_format: "mp3"
});
```

**Dashboard highlights**:
- Drag-and-drop text input with rich formatting
- Real-time audio preview during typing
- Voice library with tagging and search
- Export to multiple formats (MP3, WAV, OGG)

## Customer adoption

**Beta program results**: 200+ beta users generated over 1 million audio files in 3 months. Average user satisfaction: 4.6/5.

**Notable use cases**:
- Marketing agencies creating multilingual campaigns
- Audiobook publishers reducing production costs by 60%
- Gaming studios generating dynamic character dialogue
- Educational platforms adding narration to 10,000+ lessons

## Technical specifications

- **Supported languages**: 12 languages with regional variants
- **Voice models**: 85 pre-trained voices plus unlimited custom voices
- **Processing speed**: 60ms average latency for 100-word passages
- **File size**: Optimized models are 85% smaller than VOICE v1
- **Concurrent users**: Handles 500+ simultaneous synthesis requests

Launched in beta with 2,000 users. Full release planned for Q2 2024 with pricing tiers for individuals, teams, and enterprises.