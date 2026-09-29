//Code by Veriton. :)
function onUpdatePost(elapsed:Float) {
    if (game == null || game.healthBar == null) return;
    var healthPercent = game.healthBar.percent;

    function updateIcon(icon:Dynamic, isPlayer:Bool) {
        if (icon == null || icon.animation == null || icon.animation.curAnim == null) return;

        var hasWinningIcon = icon.animation.curAnim.frames.length >= 3;
        var isLosing = false;
        var isWinning = false;

        if (isPlayer) {
            isLosing = (healthPercent < 20);
            isWinning = (healthPercent > 80);
        } else {
            isLosing = (healthPercent > 80);
            isWinning = (healthPercent < 20);
        }

        if (hasWinningIcon) {
            if (isLosing) {
                icon.animation.curAnim.curFrame = 1;
            } else if (isWinning) {
                icon.animation.curAnim.curFrame = 2;
            } else {
                icon.animation.curAnim.curFrame = 0;
            }
        } else {
            if (isLosing) {
                icon.animation.curAnim.curFrame = 1;
            } else {
                icon.animation.curAnim.curFrame = 0;
            }
        }
    }
    updateIcon(game.iconP1, true);
    updateIcon(game.iconP2, false);
}