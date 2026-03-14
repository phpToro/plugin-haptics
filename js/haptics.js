phpToro.haptics = {
    impact: function(style) {
        return phpToro.nativeCall('haptics', 'impact', { style: style || 'medium' });
    },
    notification: function(type) {
        return phpToro.nativeCall('haptics', 'notification', { type: type || 'success' });
    },
    selection: function() {
        return phpToro.nativeCall('haptics', 'selection', {});
    }
};
