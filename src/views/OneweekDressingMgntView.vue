<template>
<div class="col-9 px-3 py-3 border border-primary bg-light">
	<h2>穿搭提案</h2>
	<table class="table table-striped border border-success p-2 mb-2">
		<thead>
			<tr>
				<th scope="col">星期</th>
				<th scope="col" colspan="2">男</th>
				<th scope="col" colspan="2">女</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">Monday</th>
				<td><img class="box" id="image" src="https://picsum.photos/200/300/?random=10"></td>
				<td><input type="file" placeholder="穿搭組合商品" id="theFile"></td>
                <td><img src="https://picsum.photos/200/300/?random=10" /></td>
				<td><input type="file" placeholder="穿搭組合商品"></td>

			</tr>
			<tr>
				<th scope="row">Monday</th>
				<td><img class="box" id="image" src="https://picsum.photos/200/300/?random=10"></td>
				<td><input type="file" placeholder="穿搭組合商品" id="theFile"></td>
                <td><img src="https://picsum.photos/200/300/?random=10" /></td>
				<td><input type="file" placeholder="穿搭組合商品"></td>
			</tr>
			<tr>
				<th scope="row">Monday</th>
				<td><img class="box" id="image" src="https://picsum.photos/200/300/?random=10"></td>
				<td><input type="file" placeholder="穿搭組合商品" id="theFile"></td>
                <td><img src="https://picsum.photos/200/300/?random=10" /></td>
				<td><input type="file" placeholder="穿搭組合商品"></td>
			</tr>
			<tr>
				<th scope="row">Monday</th>
				<td><img class="box" id="image" src="https://picsum.photos/200/300/?random=10"></td>
				<td><input type="file" placeholder="穿搭組合商品" id="theFile"></td>
                <td><img src="https://picsum.photos/200/300/?random=10" /></td>
				<td><input type="file" placeholder="穿搭組合商品"></td>
			</tr>
			<tr>
				<th scope="row">Monday</th>
				<td><img class="box" id="image" src="https://picsum.photos/200/300/?random=10"></td>
				<td><input type="file" placeholder="穿搭組合商品" id="theFile"></td>
                <td><img src="https://picsum.photos/200/300/?random=10" /></td>
				<td><input type="file" placeholder="穿搭組合商品"></td>
			</tr>
			<tr>
				<th scope="row">Monday</th>
				<td><img class="box" id="image" src="https://picsum.photos/200/300/?random=10"></td>
				<td><input type="file" placeholder="穿搭組合商品" id="theFile"></td>
                <td><img src="https://picsum.photos/200/300/?random=10" /></td>
				<td><input type="file" placeholder="穿搭組合商品"></td>
			</tr>
		</tbody>
	</table>
</div>
</template>
<script>
//     export default {
// 	name: "OneweekDressing",

    
//     methods: {
//         document.getElementById('theFile').onchange = fileChange(){
//             let file = document.getElementById('theFile').files[0] 
//         }
       
// };
</script>

<style lang="scss" scoped> 
    input{
        width: 80px;
    }
    .box{
        border: 1px solid black;
        width:200px ;
        height:300px;
    }
</style>