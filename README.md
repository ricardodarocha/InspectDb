# InspectDb
Scan a database to generate code automatically. Generate models, classes and forms processing macros for each field of a given table

		TMyModel = class(TDataModule)
		{$Loop Example}
		 f{$item.name} : {$item.type};//Item{$item.no} : {$item.type};
		{$EndLoop Example}
		{$Loop SecondExample}
			property {{$item.name}} {$item}  :  {$item.type} read get{$item} write f{$item.name}; //Simple {$item}
		{$EndLoop SecondExample}
		end;

		implementation
		{$Loop Nome}
		function TMyModel.set{$item}: {$item.type};
		begin
			result := {$item.empty};
		end;{$EndLoop Nome}
		{Summary}
		end.

will generate something like that

			TMyModel = class(TDataModule)
		{$REGION 'Gerado automaticamente para cada item {$$item}'}

		 fID : String;//Item1 : String;

		 fCodigo : Integer;//Item2 : Integer;

		 fNome : String;//Item3 : String;

		 fDescricao : String;//Item4 : String;

		 fRegras : String;//Item5 : String;

		 fEndereco : String;//Item6 : String;

		 fHistoria : String;//Item7 : String;

		 fRegiao : String;//Item8 : String;

		 fBanner : Blob;//Item9 : Blob;

		 fAvatar : Blob;//Item10 : Blob;
	{$ENDREGION}
		{$REGION 'Gerado automaticamente para cada item {$$item}'}

			property {ID} ID  :  String read getID write fID; //Simple ID

			property {Codigo} Codigo  :  Integer read getCodigo write fCodigo; //Simple Codigo

			property {Nome} Nome  :  String read getNome write fNome; //Simple Nome

			property {Descricao} Descricao  :  String read getDescricao write fDescricao; //Simple Descricao

			property {Regras} Regras  :  String read getRegras write fRegras; //Simple Regras

			property {Endereco} Endereco  :  String read getEndereco write fEndereco; //Simple Endereco

			property {Historia} Historia  :  String read getHistoria write fHistoria; //Simple Historia

			property {Regiao} Regiao  :  String read getRegiao write fRegiao; //Simple Regiao

			property {Banner} Banner  :  Blob read getBanner write fBanner; //Simple Banner

			property {Avatar} Avatar  :  Blob read getAvatar write fAvatar; //Simple Avatar
	{$ENDREGION}
		end;

		implementation
		{$REGION 'Gerado automaticamente para cada item {$$item}'}

		function TMyModel.setID: String;
		begin
			result := {};
		end;

		function TMyModel.setCodigo: Integer;
		begin
			result := -1;
		end;

		function TMyModel.setNome: String;
		begin
			result := '';
		end;

		function TMyModel.setDescricao: String;
		begin
			result := '';
		end;

		function TMyModel.setRegras: String;
		begin
			result := '';
		end;

		function TMyModel.setEndereco: String;
		begin
			result := '';
		end;

		function TMyModel.setHistoria: String;
		begin
			result := '';
		end;

		function TMyModel.setRegiao: String;
		begin
			result := '';
		end;

		function TMyModel.setBanner: Blob;
		begin
			result := null;
		end;

		function TMyModel.setAvatar: Blob;
		begin
			result := null;
		end;
	{$ENDREGION}
		{Summary}
		end.
