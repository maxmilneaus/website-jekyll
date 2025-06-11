# Front Matter Backup Documentation

**Created:** 2024-11-06  
**Purpose:** Complete backup of all front matter properties before implementing dual control system

## Summary Statistics
- **Total Files Analyzed**: 15 files
- **Files with Front Matter**: 14 files  
- **Files without Front Matter**: 1 file
- **Unique Properties Found**: 12 distinct properties

## Complete Property Inventory

### All Unique Properties Found:
1. **`layout`** (string) - Used in _pages only
   - Values: "page", "projects"
   
2. **`title`** (string) - Most common property
   - Used in 13/14 files with front matter
   - Supports Unicode characters (Korean, accented)
   - Can contain special characters (periods, spaces)
   - Sometimes quoted, sometimes unquoted
   
3. **`id`** (string) - Used only once
   - Value: "home" (in index.md)
   
4. **`permalink`** (string) - Used in _pages only
   - Values: "/", "/now", "/projects/", "/about"
   
5. **`year`** (mixed types) - Used in _projects only
   - String format: "2008 - 2024" (date range)
   - Integer format: 2024
   
6. **`description`** (string) - Used in _projects only
   - Values quoted in voice.md, unquoted in Max Milne Photography.md
   
7. **`status`** (string) - Used in _projects only
   - Value: "live" (quoted)
   
8. **`order`** (integer) - Used in _projects only
   - Values: 1, 2 (for sorting)
   
9. **`tech_stack`** (array) - Used only in voice.md
   - Value: ["Python", "TensorFlow", "FastAPI"]
   
10. **`date_range`** (string) - Used only in voice.md
    - Value: "2024" (quoted)

## Original Front Matter by File

### _PAGES Directory

#### index.md
```yaml
---
layout: page
title: Home
id: home
permalink: /
---
```

#### Now.md
```yaml
---
layout: page
title: Now
permalink: /now
---
```

#### projects.md
```yaml
---
layout: projects
title: Projects
permalink: /projects/
---
```

#### About.md
```yaml
---
layout: page
title: About
permalink: /about
---
```

### _NOTES Directory

#### accents.md
```yaml
---
title: Bon appétit!
---
```

#### consistency.md
```yaml
---
title: Consistency is key
---
```

#### move your body every day.md
```yaml
---
---
```

#### your-first-note.md
```yaml
---
title: Your first seed
---
```

#### 안녕하세요.md
```yaml
---
title: 안녕하세요
---
```

#### Talk.Art.Therapy..md
```yaml
---
title: Talk.Art.Therapy
---
```

#### Studio Brunswick.md
```yaml
---
title: Studio Brunswick
---
```

#### animals/cats.md
```yaml
---
title: A note about cats
---
```

#### animals/tigers.md
```yaml
---
title: Tigers
---
```

### _PROJECTS Directory

#### Max Milne Photography.md
```yaml
---
title: Max Milne Photography
year: 2008 - 2024
description: Advertising and Fine Art Photography
order: 1
---
```

#### voice.md
```yaml
---
title: "VOICE"
year: 2024
description: "AI voice synthesis tool"
status: "live"
order: 2
tech_stack: ["Python", "TensorFlow", "FastAPI"]
date_range: "2024"
---
```

## Notes for Restoration
- Some files use quoted values, others don't - preserve this inconsistency if restoring
- Unicode characters (Korean, accented) are supported
- One file has empty front matter with just YAML delimiters
- Projects have the most complex metadata structure
- Years can be integers (2024) or strings ("2008 - 2024")