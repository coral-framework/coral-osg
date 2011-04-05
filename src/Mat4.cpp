#include "Matrix_Adapter.h"

namespace coOsg
{
	co::int32 Matrix_Adapter::getDummy( coOsg::Matrix& instance )
	{
		// dummy function, do nothing
		return 0;
	}
	/*
	void Matrix_Adapter::e( coOsg::Matrix& instance, co::int32 i, co::int32 j, double& element )
	{
		element = instance.ptr()[i*4 + j];
	}

	void Matrix_Adapter::makeIdentity( coOsg::Matrix& instance )
	{
		instance.makeIdentity();
	}

	void Matrix_Adapter::makeRotate( coOsg::Matrix& instance, double angle, const coOsg::Vec3& axis )
	{
		instance.makeRotate( angle, axis );
	}

	void Matrix_Adapter::makeScale( coOsg::Matrix& instance, const coOsg::Vec3& scale )
	{
		instance.makeScale( scale );
	}

	void Matrix_Adapter::makeTranslate( coOsg::Matrix& instance, const coOsg::Vec3& translation )
	{
		instance.makeTranslate( translation );
	}

	void Matrix_Adapter::postMult( coOsg::Matrix& instance, const coOsg::Vec3& v, coOsg::Vec3& result )
	{
		result = instance.postMult( v );
	}

	void Matrix_Adapter::preMult( coOsg::Matrix& instance, const coOsg::Vec3& v, coOsg::Vec3& result )
	{
		result = instance.preMult( v );
	}
	*/
}

