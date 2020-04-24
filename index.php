<?php
    include('config.php');
    $field_sql = mysqli_query($db, "SELECT * FROM fields");
    $fields = array();
    while ($row = mysqli_fetch_array($field_sql, MYSQLI_ASSOC)) {
        $fields[$row['field_id']] = $row;
    }

    $formula_sql = mysqli_query($db, "SELECT * FROM formulas");
    $headertextary = array();
    $headertext = mysqli_query($db, "SELECT * FROM headercontent");
<<<<<<< HEAD
    
    if($headertext)
        while ($header = mysqli_fetch_array($headertext, MYSQLI_ASSOC)) {
            $headertextary[$header['id']] = $header;
            
        }

=======
    if($headertext)
        while ($header = mysqli_fetch_array($headertext, MYSQLI_ASSOC)) {
            $headertextary[$header['id']] = $header;
        }
>>>>>>> 8285db1539f08cff4d7182310fa6fc72639680ef
    function display($field) {
        echo '
            <div class="field">
                <span class="field-name">'
                    .$field['field_label'] .
                    '<div class="hover">
                        <i class="fa fa-info-circle tooltip"></i>
                        <div class="tooltipcontainer">' .  $field['description'] . '</div>
                    </div>
                </span>';

        $editable = $field['editable'] ? '' : 'readonly';

        if (!$field['type']) {
            echo '<input class="field-value" type="number" id="' . $field['field_id']  . '" value="' . $field['value'] . '"' . $editable . '>';
        } else {
            $valuearray = preg_split('/,/', $field['value']);
            echo '<select id="' . $field['field_id'] . '" class="field-value">';
            foreach ($valuearray as $key => $value) {
                echo '<option value="' . $value . '">' . $value . '</option>';
            }
                
            echo '</select>';
        }

        echo '<span class="unit">' . $field['unit'] . '</span>
            </div>';
    }

    // function showNewFields($fields) {
    //     foreach ($fields as $key => $values) {
    //         if ($values['new_field'] == 1) {
    //             display($values);
    //         }
    //     }
    // }

    function showRow($fields, $row_id) {
        foreach ($fields as $key => $values) {
            if ($values['header_id'] == $row_id) {
                display($values);
            }
        }
    }
?>


<!DOCTYPE html>
<!-- saved from url=(0033)http://demo1.viwiz.net/simulator/ -->
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Simulator</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/font-awesome/css/font-awesome.min.css">
</head>

<script>
    var formulas = [];
<?php while ($row = mysqli_fetch_array($formula_sql, MYSQLI_ASSOC)) { ?>
    formulas.push({
        field_id: "<?php echo $row['field_id'];?>",
        formula: "<?php echo $row['formula'];?>"
    });
<?php } ?>
</script>
<body>
    <section id="header">
        <div class="container">
            <?php if($headertextary[0]['content']) {?>
                <h1><?php echo $headertextary[0]['content']; ?></h1>
            <?php } else{ ?>
                <h1><?php echo "Set Header!"; } ?></h1>
        </div>
    </section>

    <section id="content">
        <div class="container">
            <div class="left-col">
                <div class="row">
                <?php if($headertextary[1]['content']) {?>
                    <h2 class="title"><?php echo $headertextary[1]['content']; ?></h2>
                <?php } else{ ?>
                    <h2 class="title"><?php echo "Set Category!"; } ?></h2>
<<<<<<< HEAD
                    <div class="row">
                        <div class="content-col">
                            <div class="content-col-left col-sm-6">
                                <?php showRow($fields, 1)?>    
=======
                    <div class="content-col">
                        <div class="content-col-left">
                            <?php display($fields['f1']);?>
                            <?php display($fields['f4']);?>
                            <?php display($fields['f5']);?>
                            <div class="field">
                                <span class="field-name">
                                    Demande Spoc
                                    <div class="hover">
                                        <i class="fa fa-info-circle tooltip"></i>
                                        <div class="tooltipcontainer"><?php echo $fields['f18']['description'];?></div>
                                    </div>
                                </span>
                                <label class="custom-checkbox">
                                    <input id="f18" type="checkbox" checked="checked">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="field">
                                <span class="field-name">
                                    Recouvrement
                                    <div class="hover">
                                        <i class="fa fa-info-circle tooltip"></i>
                                        <div class="tooltipcontainer"><?php echo $fields['f20']['description'];?></div>
                                    </div>
                                </span>
                                <label class="custom-checkbox">
                                    <input id="f20" type="checkbox" checked="checked">
                                    <span class="checkmark"></span>
                                </label>
>>>>>>> 8285db1539f08cff4d7182310fa6fc72639680ef
                            </div>
                            <div class="col-sm-6">  </div>
                        </div>
<<<<<<< HEAD
                    </div>
                    <div class="row">
                        <div class="content-col">
                            <div class="content-col-left col-sm-6">
                                <div class="field">
                                    <span class="field-name">
                                        Demande Spoc
                                        <div class="hover">
                                            <i class="fa fa-info-circle tooltip"></i>
                                            <div class="tooltipcontainer"><?php echo $fields['f18']['description'];?></div>
                                        </div>
                                    </span>
                                    <label class="custom-checkbox">
                                        <input id="f18" type="checkbox" checked="checked">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="field">
                                    <span class="field-name">
                                        Recouvrement
                                        <div class="hover">
                                            <i class="fa fa-info-circle tooltip"></i>
                                            <div class="tooltipcontainer"><?php echo $fields['f20']['description'];?></div>
                                        </div>
                                    </span>
                                    <label class="custom-checkbox">
                                        <input id="f20" type="checkbox" checked="checked">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                            <div>
                                <div><?php display($fields['f19']);?></div>
                                <div><?php display($fields['f21']);?></div>
                            </div>
=======
                        <div class="content-col-right">
                            <div id="content-col-right-first"><?php display($fields['f19']);?></div> 
                            <div id="content-col-right-second"><?php display($fields['f21']);?></div>
>>>>>>> 8285db1539f08cff4d7182310fa6fc72639680ef
                        </div>
                    </div>
                </div>
            </div>
            <div class="center-col">
                <div class="row">
                    <?php if($headertextary[2]['content']) {?>
                        <h2 class="title"><?php echo $headertextary[2]['content']; ?></h2>
                    <?php } else{ ?>
                        <h2 class="title"><?php echo "Set Category!"; } ?></h2>
<<<<<<< HEAD
                        <?php showRow($fields, 2)?>
=======
                    <?php display($fields['f6']);?>
                    <?php display($fields['f7']);?>
                    <?php display($fields['f2']);?>
                    <?php display($fields['f3']);?>
>>>>>>> 8285db1539f08cff4d7182310fa6fc72639680ef
                </div>
                <div class="row">
                    <?php if($headertextary[3]['content']) {?>
                        <h2 class="title"><?php echo $headertextary[3]['content']; ?></h2>
                    <?php } else{ ?>
                        <h2 class="title"><?php echo "Set Category!"; } ?></h2>
<<<<<<< HEAD
                        <?php showRow($fields, 3)?>
=======
                    <?php display($fields['f8']);?>
                    <?php display($fields['f9']);?>
                    <?php display($fields['f10']);?>
                    <?php display($fields['f11']);?>
                    <?php display($fields['f12']);?>
                    <?php display($fields['f13']);?>
                    <?php display($fields['f14']);?>
                    <?php display($fields['f15']);?>
                    <?php display($fields['f16']);?>
                    <?php display($fields['f17']);?>
>>>>>>> 8285db1539f08cff4d7182310fa6fc72639680ef
                </div>
                <div class="row">
                    <?php if($headertextary[4]['content']) {?>
                        <h2 class="title"><?php echo $headertextary[4]['content']; ?></h2>
                    <?php } else{ ?>
                        <h2 class="title"><?php echo "Set Category!"; } ?></h2>
<<<<<<< HEAD
                        <?php showRow($fields, 4)?>
=======
                    <?php display($fields['f23']);?>
                    <?php display($fields['f24']);?>
                    <?php display($fields['f25']);?>
>>>>>>> 8285db1539f08cff4d7182310fa6fc72639680ef
                </div>
            </div>
            <div class="right-col">
                <div class="row">
                    <?php if($headertextary[5]['content']) {?>
                        <h2 class="title"><?php echo $headertextary[5]['content']; ?></h2>
                    <?php } else{ ?>
                        <h2 class="title"><?php echo "Set Category!"; } ?></h2>
<<<<<<< HEAD
                        <?php showRow($fields, 5)?>
=======
                    <?php display($fields['f30']);?>
                    <?php display($fields['f31']);?>
>>>>>>> 8285db1539f08cff4d7182310fa6fc72639680ef
                </div>
                <div class="result">
                    <span class="field-name">Augmentation du salaire</span>
                    <div id="f34">
                        <p id="f34-text">Contacter nous, si vous êtes intérés pour avoir <span id="f34-value">341.04662114433717</span>%
                            d'augmentation</p>
                    </div>
                </div>

                <input type="hidden" id="f24" value="<?php echo $fields['f24'];?>" readonly />
                <input type="hidden" id="f27" value="<?php echo $fields['f27'];?>" readonly />
            </div>
        </div>
    </section>

</body>
<script src="./js/jquery.min.js"></script>
<script>
    $(function() {
        var f18 = $("#f18").prop("checked") ? 1 : 0;
        var f20 = $("#f20").prop("checked") ? 1 : 0;

        $("#f18").change(function () {
            f18 = $("#f18").prop("checked") ? 1 : 0;
        });

        $("#f20").change(function () {
            f20 = $("#f20").prop("checked") ? 1 : 0;
        });

        $("input").keydown(function () {
            computeValue(f18, f20);
        });
        
        $("input").change(function () {
            computeValue(f18, f20);
        });
        
        $("select").change(function () {
            computeValue(f18, f20);
        });
        
        $('.tooltip, .tooltipcontainer').hover(
            function () {
                $(this).parent().find('.tooltipcontainer').eq(0).show();
            },
            function () {
                $(this).parent().find('.tooltipcontainer').eq(0).hide();
            }
        );

        $('.tooltip').mouseout(function () {
            $(this).parent().find('.tooltipcontainer').eq(0).hide();
        });

        computeValue();

        function computeValue() {
            var f1 = $("#f1").val() * 1;
            var f2 = $("#f2").val() * 1;
            var f3 = $("#f3").val() * 1;
            var f4 = $("#f4").val() / 100 * 1;
            var f6 = $("#f6").val() * 1;
            var f19 = -f18 * 500;
            var f21 = -f20 * 200;
            var f8 = $("#f8").val() * 1;
            var f9 = $("#f9").val() * 1;
            var f10 = $("#f10").val() * 1;
            var f11 = $("#f11").val() * 1;
            var f13 = $("#f13").val() * 1;
            var f14 = $("#f14").val() * 1;
            var f15 = $("#f15").val() * 1;
            var f16 = $("#f16").val() * 1;
            var f24 = $("#f24").val() * 1;

            var f26 = 1, f5, f12, f32, f33, f27, f30, f17, f31, f25;

            var index = 0;
            while (index <= formulas.length) {
                index++;
                formulas.forEach(function(obj) {
                    try {
                        var ret = null;
                        eval (`ret = ${obj.field_id}`);
                        if (isNaN(ret) || ret == undefined) {
                            eval(`${obj.field_id}=${obj.formula};`);
                            eval(`$("#${obj.field_id}").val(${obj.field_id});`);
                        }
                    } catch (e) {
                        console.log(e);
                    }
                });
            }

            $("#f34-value").html(`${f34}%`);
            if (f34 > 0) {
                $("#f34-text").html(
                    `Contacter nous, si vous êtes intérés pour avoir ${f34}% d'augmentation`
                );
            } else {
                $("#f34-text").html(
                    `Votre salaire actuelle semble optimisé par rapport aux services attendues de votre employeyur`
                );
            }
        }

    });
</script>

</html>