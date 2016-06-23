# Drone Write File Plugin

Write a file in your pipeline using a combination of nodejs and shell.

Unfortunately, **multiline JavaScript requires semicolons**.

```yaml
pipeline:
  status-diff-cover:
    image: plugins/drone-write-status
    out: drone-status/diff-cover.status
    # succeed if coverage above 30%
    succeed_if: |
      function () {
        var cov = /Coverage: ([\d\.]+)%/.exec(`$(cat reports/diff-cover.txt)`);
        return cov && parseFloat(cov[1]) > 30;
      }()
    url: '$(cat uploads/diff-cover.url)'
```
