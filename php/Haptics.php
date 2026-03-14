<?php

namespace PhpToro\Plugins\Haptics;

class Haptics
{
    public static function impact(string $style = 'medium'): void
    {
        phptoro_native_call('haptics', 'impact', json_encode(['style' => $style]));
    }

    public static function notification(string $type = 'success'): void
    {
        phptoro_native_call('haptics', 'notification', json_encode(['type' => $type]));
    }

    public static function selection(): void
    {
        phptoro_native_call('haptics', 'selection', '{}');
    }
}
