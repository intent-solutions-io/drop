# Pandoc Options Reference

Quick reference for pandoc PDF generation used by the `/ship-shelly` skill.

## Basic Command

```bash
pandoc INPUT.md -o OUTPUT.pdf --pdf-engine=xelatex
```

## Full Command (with all options)

```bash
pandoc CHANGELOG.md \
  -o changelog.pdf \
  --pdf-engine=xelatex \
  --template=cwh-report.latex \
  -V title="Creative Wheel House Progress Report" \
  -V author="Jeremy Longshore" \
  -V date="$(date '+%B %d, %Y')" \
  --toc \
  --toc-depth=2 \
  --highlight-style=tango
```

## Key Options

| Option | Purpose | Example |
|--------|---------|---------|
| `--pdf-engine` | LaTeX engine to use | `xelatex` (best for Unicode) |
| `--template` | Custom LaTeX template | `cwh-report.latex` |
| `-V key=value` | Set template variable | `-V title="Report"` |
| `--toc` | Generate table of contents | (flag only) |
| `--toc-depth` | TOC heading depth | `2` (sections + subsections) |
| `--highlight-style` | Code syntax highlighting | `tango`, `pygments`, `kate` |

## Template Variables

Variables set with `-V` that our template uses:

| Variable | Description | Example |
|----------|-------------|---------|
| `title` | Document title | "Progress Report" |
| `author` | Author name | "Jeremy Longshore" |
| `date` | Document date | "January 9, 2026" |

## PDF Engines

| Engine | Pros | Cons |
|--------|------|------|
| `xelatex` | Best Unicode support, modern fonts | Slower |
| `pdflatex` | Fastest, most compatible | Limited Unicode |
| `lualatex` | Programmable, good fonts | Slowest |

**Recommendation**: Use `xelatex` for best results with modern documents.

## Troubleshooting

### Missing LaTeX packages

```bash
sudo apt install texlive-xetex texlive-fonts-recommended texlive-latex-extra
```

### Font not found

The template uses DejaVu fonts. Install with:
```bash
sudo apt install fonts-dejavu
```

### Table of contents not appearing

Ensure your markdown has proper heading hierarchy:
```markdown
# Top Level (H1)
## Second Level (H2)
### Third Level (H3)
```

### Code blocks not highlighted

Check that the language is specified:
```markdown
```python
print("Hello")
```
```

## Customization

To modify the PDF appearance, edit:
- `templates/cwh-report.latex` - Overall document structure
- Colors: `CWHBlue`, `CWHGray`, `CWHLightGray`
- Fonts: Change `\setmainfont` and `\setmonofont`
- Margins: Modify `\geometry{margin=1in}`

## Resources

- [Pandoc User's Guide](https://pandoc.org/MANUAL.html)
- [LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX)
- [XeTeX Documentation](https://tug.org/xetex/)
