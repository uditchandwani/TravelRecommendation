function refresh()
        {
            document.myForm.save.name="save";
            document.myForm.save.value="Save";
            
        }

        function del(id,file)
        {
            if(confirm("Are you sure want to delete ? "))
            {
                window.location.href = file+'?del='+id;
            }
        }